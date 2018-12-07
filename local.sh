# Local CMSSW installation
VO_CMS_SW_DIR=/mnt/home/fwyzard/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/mnt/ceph/users/fwyzard

# Local cache of the input files
TTBAR_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_4_0_pre2/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_103X_upgrade2018_realistic_v8-v1/10000"
TTBAR_CACHE_FILE="29C415A1-48E9-8445-A19C-49B84D1505ED.root"
ZMUMU_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_4_0_pre2/RelValZMM_13/GEN-SIM-DIGI-RAW/103X_upgrade2018_realistic_v8-v1/10000"
ZMUMU_CACHE_FILE="2AB9A860-9F4D-3F40-9346-DDD02622A716.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://${USER}.web.cern.ch/${USER}/patatrack/pulls"
UPLOAD_DIR="$HOME/www/patatrack/pulls"
