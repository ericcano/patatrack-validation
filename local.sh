# Local CMSSW installation
VO_CMS_SW_DIR=/mnt/home/fwyzard/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/mnt/ceph/users/fwyzard

# Local cache of the input files
TTBAR_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_5_0_pre2/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_105X_upgrade2018_realistic_v2-v1/10000"
TTBAR_CACHE_FILE="5FA56A8A-EC74-864D-87BE-E22CBA9850BC.root,D182811F-A79C-AA46-B3CB-1A6070F808A1.root"
ZMUMU_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_5_0_pre2/RelValZMM_13/GEN-SIM-DIGI-RAW/105X_upgrade2018_realistic_v2-v1/10000"
ZMUMU_CACHE_FILE="526BBFE0-3458-6646-8044-3447DCC79924.root,6308E81F-439E-FC4E-B5E1-204AD62395C7.root"
TTBARDESIGN_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_5_0_pre2/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_105X_upgrade2018_design_v2-v1/10000"
TTBARDESIGN_CACHE_FILE="C08E5C2F-FEA8-F140-B524-A2B9413CE3E3.root,ED8BDE92-B216-8540-A13E-1A3738AEE5BD.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://${USER}.web.cern.ch/${USER}/patatrack/pulls"
UPLOAD_DIR="$HOME/www/patatrack/pulls"
