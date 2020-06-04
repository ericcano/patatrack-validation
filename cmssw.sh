# Local configuration
#VO_CMS_SW_DIR from local.sh

# CMSSW configuration
export SCRAM_ARCH=slc7_amd64_gcc820
source $VO_CMS_SW_DIR/cmsset_default.sh

# Reference release
REFERENCE_RELEASE=CMSSW_11_1_0_pre8

# Development branch and latest release
#DEVELOPMENT_BRANCH=master
#DEVELOPMENT_RELEASE=CMSSW_11_0_0
DEVELOPMENT_BRANCH=CMSSW_11_1_X_Patatrack
DEVELOPMENT_RELEASE=CMSSW_11_1_0_pre8_Patatrack

# Number of threads and streams used in each job
THREADS=8
STREAMS=8

# runTheMatrix MC workflows
REFERENCE_WORKFLOW="10824.5"
WORKFLOWS="10824.5 10824.501 10824.502 10824.511 10824.512"

# runTheMatrix data Workflows
DATA_WORKFLOWS="136.885502 136.885512"

# Enable profiling and memcheck for selected workflows
VALIDATE="10824.5 10824.501 10824.502 10824.511 10824.512"
PIXEL_PROFILING="10824.502 136.885502"
PIXEL_PROFILING_FILE=RecoPixelVertexing/Configuration/customizePixelTracksForProfiling
PIXEL_PROFILING_FUNC=customizePixelTracksForProfilingGPUOnly
ECAL_PROFILING="10824.512 136.885512"
ECAL_PROFILING_FILE=RecoLocalCalo/Configuration/customizeEcalOnlyForProfiling
ECAL_PROFILING_FUNC=customizeEcalOnlyForProfilingGPUOnly
PROFILING="$PIXEL_PROFILING $ECAL_PROFILING"
MEMCHECKS="10824.502 10824.512"

# Default number of events (overridden with sample-specific values in input.sh)
NUMEVENTS=100

# Number of events for the memcheck workflows
MEMCHECK_NUMEVENTS=10


function get_profiling_file() {
  local WORKFLOW="$1"
  [ "$WORKFLOW" ] || return
  echo "$PIXEL_PROFILING" | grep -q -w "$WORKFLOW" && echo "$PIXEL_PROFILING_FILE"
  echo "$ECAL_PROFILING"  | grep -q -w "$WORKFLOW" && echo "$ECAL_PROFILING_FILE"
}

function get_profiling_function() {
  local WORKFLOW="$1"
  [ "$WORKFLOW" ] || return
  echo "$PIXEL_PROFILING" | grep -q -w "$WORKFLOW" && echo "$PIXEL_PROFILING_FUNC"
  echo "$ECAL_PROFILING"  | grep -q -w "$WORKFLOW" && echo "$ECAL_PROFILING_FUNC"
}

function setup_release() {
  local DIRNAME="$1"
  local RELEASE="$2"
  # set up the reference area
  cd $BASE
  echo "# set up $DIRNAME environment for release $RELEASE"
  scram project -n $DIRNAME CMSSW $RELEASE
  cd $DIRNAME/src
  eval $(scram runtime -sh)
  git cms-init --upstream-only
  echo
  # <add here any required pull request or external update>
  #git cms-addpkg HeterogeneousCore
  #USER_CXXFLAGS="-g -rdynamic" USER_CUDA_FLAGS="-g -lineinfo" scram b -j
  git rev-parse --short=12 HEAD > ../hash
  echo
}

function setup_development_release() {
  local DIRNAME="$1"
  local RELEASE="$2"
  local BRANCH="$3"
  local REPOSITORY="$4"

  # set up a development area
  cd "$BASE"
  echo "# set up $DIRNAME environment for release $RELEASE"
  scram project -n $DIRNAME CMSSW $RELEASE
  cd $DIRNAME/src
  eval $(scram runtime -sh)
  # git needs some special care
  git cms-init -x $REPOSITORY --upstream-only
  # <add here any required pull request or external update>
  git checkout $REPOSITORY/$BRANCH -b $BRANCH
  git rev-parse --short=12 HEAD > ../hash

  # configure the cuda tool for the devices present on the local system
  cmsCudaSetup.sh
  # check if there are any differences with respect to the base release
  if ! git diff --quiet $CMSSW_VERSION; then
    # check out all modified packages ...
    git diff $CMSSW_VERSION --name-only | cut -d/ -f-2 | sort -u | xargs -r git cms-addpkg || true
    # ... and their dependencies
    git cms-checkdeps -a
  fi
  # checkout all packages containing CUDA code, and rebuild all checked out packages with debug symbols
  USER_CXXFLAGS="-g -rdynamic" USER_CUDA_FLAGS="-g -lineinfo" cmsCudaRebuild.sh

  if [ $(git rev-parse $RELEASE) != $(git rev-parse HEAD) ]; then
    echo "# update $DIRNAME environment on branch $BRANCH with"
    git log --oneline --reverse --no-decorate ${RELEASE}..
  fi
  echo
}

function clone_release() {
  local SOURCE="$1"
  local TARGET="$2"
  cd "$BASE"
  cp -ar "$SOURCE" "$TARGET"
  cd "$TARGET"/src
  scram b ProjectRename
  eval $(scram runtime -sh)
  git config --local commit.gpgsign false
  echo
}

