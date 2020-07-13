# Local CMSSW installation
VO_CMS_SW_DIR=/data/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/gpu_data

# Local cache of the input files
TTBAR_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_1_0_pre8/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU_111X_mcRun3_2021_realistic_v4-v1/20000"
TTBAR_CACHE_FILE="6767846A-04AA-AD40-BDAB-407450210E53.root"
ZMUMU_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_1_0_pre8/RelValZMM_14/GEN-SIM-DIGI-RAW/111X_mcRun3_2021_realistic_v4-v1/20000"
ZMUMU_CACHE_FILE="3FE6B733-ACC3-E041-AE39-9926ADCA8651.root"
ZEE_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_1_0_pre8/RelValZEE_14/GEN-SIM-DIGI-RAW/111X_mcRun3_2021_realistic_v4-v1/20000"
ZEE_CACHE_FILE="ADF8F082-53D0-F24C-8901-EDE60A416BF9.root"

L1ACCEPT_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/data/Run2018D/EphemeralHLTPhysics1/RAW/v1/000/323/775/00000"
L1ACCEPT_CACHE_FILE="A27DFA33-8FCB-BE42-A2D2-1A396EEE2B6E.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://patatrack.web.cern.ch/patatrack/validation/pulls"
UPLOAD_DIR="/eos/home-f/fpantale/www/patatrack-website/validation/pulls"
LOCAL_DIR="/data/user/$USER/patatrack-validation/pulls"
