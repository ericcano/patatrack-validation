# Local CMSSW installation
VO_CMS_SW_DIR=/mnt/home/fwyzard/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/mnt/ceph/users/fwyzard

# Local cache of the input files
TTBAR_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_5_0/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_105X_upgrade2018_realistic_v4_HS-v1/10000"
TTBAR_CACHE_FILE="570CA46B-B8F6-BB48-814C-3D788DF69BE1.root,A009EE8F-C5B2-6A42-8AB6-41A54A75D5C0.root,BE2CC0CE-0BBE-084D-AB49-0F76D3312C22.root,065D46F0-9E8E-0549-9314-DBDC3DC83CAD.root,877EC832-93E5-6C4A-A905-CAD074EB1862.root"
ZMUMU_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_5_0/RelValZMM_13/GEN-SIM-DIGI-RAW/105X_upgrade2018_realistic_v4_HS-v1/10000"
ZMUMU_CACHE_FILE="A0865640-8247-9541-B905-1CF0F780B208.root"
TTBARDESIGN_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_10_5_0/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_105X_upgrade2018_design_v3_HS-v1/10000"
TTBARDESIGN_CACHE_FILE="EDEA7471-BA5A-1147-A442-F2F6B6D6034B.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://${USER}.web.cern.ch/${USER}/patatrack/pulls"
UPLOAD_REL="www/patatrack/pulls"
UPLOAD_DIR="$HOME/$UPLOAD_REL"
