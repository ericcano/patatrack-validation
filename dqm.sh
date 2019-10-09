# DQM-related configuration

# DQM files produced by step4
DQMFILE="DQM_V0001_R000000001__Global__CMSSW_X_Y_Z__RECO.root"

# URL of the DQM GUI used to upload files
DQMGUI_URL="http://dqmgui7.cern.ch:8060/dqm/dev"


# Build a link to the DQM GUI showing one or more test results
#
# Usage:
#   build_dqm_link REFERENCE_DATASET [DATASET ...]
#
function build_dqm_link() {
  [ "$1" ] || return
  local URL="$DQMGUI_URL/start?runnr=1;"
  URL+="dataset=$1;"
  URL+="sampletype=offline_relval;"
  URL+="filter=all;"
  URL+="referencepos=ratiooverlay;"
  URL+="referenceshow=all;"
  URL+="referencenorm=False;"
  if [ "$2" ]; then
    URL+="referenceobj1=other%3A%3A$2%3A;"
  else
    URL+="referenceobj1=none;"
  fi
  if [ "$3" ]; then
    URL+="referenceobj2=other%3A%3A$3%3A;"
  else
    URL+="referenceobj2=none;"
  fi
  if [ "$4" ]; then
    URL+="referenceobj3=other%3A%3A$4%3A;"
  else
    URL+="referenceobj3=none;"
  fi
  if [ "$5" ]; then
    URL+="referenceobj4=other%3A%3A$5%3A;"
  else
    URL+="referenceobj4=none;"
  fi
  URL+="search=;"
  URL+="striptype=object;"
  URL+="stripruns=;"
  URL+="stripaxis=run;"
  URL+="stripomit=none;"
  URL+="workspace=Everything;"
  URL+="size=L;"
  URL+="root=Tracking;"
  URL+="focus=;"
  URL+="zoom=no;"
  echo "$URL"
}

# Usage:
#   build_dqm_dataset RELEASE DATASET WORKFLOW
function build_dqm_dataset() {
  local RELEASE="$1"
  local DATASET="$2"
  local WORKFLOW="$3"
  local WORKDIR=$(echo $DATASET | cut -d/ -f 2-3 --output-delimiter=-)
  local FILE=$BASE/$RELEASE/run/$WORKDIR/$WORKFLOW/$DQMFILE
  local HASH=$(<$BASE/$RELEASE/hash)
  [ -f "$FILE" ] && echo "$(echo $DATASET | cut -d/ -f-3)-${HASH}/${WORKFLOW/./_}"
}


# Usage:
#   build_dqm_filename RELEASE DATASET WORKFLOW
function build_dqm_filename() {
  local RELEASE="$1"
  local DATASET="$2"
  local WORKFLOW="$3"
  local NAME=$(echo $DATASET | cut -d/ -f-3 | sed -e's|/|__|g')
  local HASH=$(<$BASE/$RELEASE/hash)
  echo "DQM_V0001_R000000001${NAME}-${HASH}__${WORKFLOW/./_}.root"
}


# Upload DQM plots to the GUI.
#
# Usage:
#   upload_dqm_plots REFERENCE_RELEASE [[RELEASE ...] TARGET_RELEASE]
#
function upload_dqm_plots() {
  [ "$1" ] || return 1
  local REFERENCE_RELEASE="$1"; shift
  local RELEASES=("$@")

  # download the DQM upload tool
  DQMGUI_UPLOAD=$(dirname $(readlink -f ${BASH_SOURCE[0]}))/visDQMUpload
  if ! [ -x $DQMGUI_UPLOAD ]; then
    DQMGUIREPO="https://raw.githubusercontent.com/rovere/dqmgui/index128"
    wget -q "$DQMGUIREPO/bin/visDQMUpload" "$DQMGUIREPO/src/python/DQM/visDQMUtils.py" -nd -P $(dirname $DQMGUI_UPLOAD)/
    chmod +x $DQMGUI_UPLOAD
  fi

  report "### DQM GUI plots"

  local SAMPLE
  for SAMPLE in $SAMPLES; do
    local DATASET=${!SAMPLE}
    report "#### $DATASET"
    local WORKDIR=$(echo $DATASET | cut -d/ -f 2-3 --output-delimiter=-)
    mkdir -p $BASE/dqm/$WORKDIR
    cd $BASE/dqm/$WORKDIR

    # reference release and workflow
    local DQMGUI_FILEFILE=$(build_dqm_filename $REFERENCE_RELEASE $DATASET $REFERENCE_WORKFLOW)
    local FILE=$BASE/$REFERENCE_RELEASE/run/$WORKDIR/$REFERENCE_WORKFLOW/$DQMFILE
    if [ -f $FILE ]; then
      ln -s $FILE $DQMGUI_FILEFILE
      report "  - reference [DQM plots]($(build_dqm_link $(build_dqm_dataset $REFERENCE_RELEASE $DATASET $REFERENCE_WORKFLOW))) for $REFERENCE_RELEASE release, workflow $REFERENCE_WORKFLOW"
    else
      report "  - :warning: reference DQM plots for $REFERENCE_RELEASE release, workflow $REFERENCE_WORKFLOW are **missing**"
    fi

    # development releases and workflows
    local RELEASE
    for RELEASE in ${RELEASES[@]}; do
      local WORKFLOW
      for WORKFLOW in $WORKFLOWS; do
        local DQMGUI_FILEFILE=$(build_dqm_filename $RELEASE $DATASET $WORKFLOW)
        local FILE=$BASE/$RELEASE/run/$WORKDIR/$WORKFLOW/$DQMFILE
        if [ -f $FILE ]; then
          ln -s $FILE $DQMGUI_FILEFILE
          report "  - [DQM plots]($(build_dqm_link $(build_dqm_dataset $RELEASE $DATASET $WORKFLOW))) for $RELEASE release, workflow $WORKFLOW"
        else
          report "  - :warning: DQM plots for $RELEASE release, workflow $WORKFLOW are **missing**"
        fi
      done
    done

    # upload all DQM files in the background
    $DQMGUI_UPLOAD $DQMGUI_URL DQM_*.root >& upload.log &

    # DQM-based validation of all workflows across all releases
    local WORKFLOW
    for WORKFLOW in $WORKFLOWS; do
      if [ "$WORKFLOW" == "$REFERENCE_WORKFLOW" ]; then
        # reference workflow
        local LINK=$(build_dqm_link \
          $(for RELEASE in ${REFERENCE_RELEASE} ${RELEASES[@]}; do build_dqm_dataset $RELEASE $DATASET $WORKFLOW; done) \
        )
        report "  - [DQM comparison]($LINK) for reference workflow $WORKFLOW"
      else
        # other workflows
        [ "${RELEASES[0]}" ] || continue
        local LINK=$(build_dqm_link \
          $(build_dqm_dataset ${RELEASES[0]} $DATASET $REFERENCE_WORKFLOW) \
          $(for RELEASE in ${RELEASES[@]}; do build_dqm_dataset $RELEASE $DATASET $WORKFLOW; done) \
        )
        report "  - [DQM comparison]($LINK) for workflow $WORKFLOW"
      fi
    done
    report

  done
}
