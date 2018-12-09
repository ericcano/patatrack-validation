# Local CMSSW installation
VO_CMS_SW_DIR=/mnt/home/fwyzard/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/mnt/ceph/users/fwyzard

# Local cache of the input files
TTBAR_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_4_0_pre3/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_103X_upgrade2018_realistic_v8-v1/20000"
TTBAR_CACHE_FILE="3C73916A-A821-7D44-8998-242B69D899ED.root"
ZMUMU_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_4_0_pre3/RelValZMM_13/GEN-SIM-DIGI-RAW/103X_upgrade2018_realistic_v8-v1/20000"
ZMUMU_CACHE_FILE="798D5D0C-3903-3542-9187-BA75B42D3540.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://${USER}.web.cern.ch/${USER}/patatrack/pulls"
UPLOAD_DIR="$HOME/www/patatrack/pulls"
