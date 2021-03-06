# Local CMSSW installation
VO_CMS_SW_DIR=/data/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/gpu_data

# Local cache of the input files
TTBAR_CACHE_PATH="/store/relval/CMSSW_11_2_0_pre3/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU_112X_mcRun3_2021_realistic_v5-v1/20000"
TTBAR_CACHE_FILE="0F40986A-FECA-F04A-99E9-4F35A32C369E.root"
ZMUMU_CACHE_PATH="/store/relval/CMSSW_11_2_0_pre3/RelValZMM_14/GEN-SIM-DIGI-RAW/112X_mcRun3_2021_realistic_v5-v1/20000"
ZMUMU_CACHE_FILE="485DE162-8A9C-FF41-93F6-114736023906.root"
ZEE_CACHE_PATH="/store/relval/CMSSW_11_2_0_pre3/RelValZEE_14/GEN-SIM-DIGI-RAW/112X_mcRun3_2021_realistic_v5-v1/20000"
ZEE_CACHE_FILE="8B6D7E62-F530-ED48-B912-24B9CF6BF6E9.root"

L1ACCEPT_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/data/Run2018D/EphemeralHLTPhysics1/RAW/v1/000/323/775/00000"
L1ACCEPT_CACHE_FILE="A27DFA33-8FCB-BE42-A2D2-1A396EEE2B6E.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://patatrack.web.cern.ch/patatrack/validation/pulls"
UPLOAD_DIR="/eos/home-f/fpantale/www/patatrack-website/validation/pulls"
LOCAL_DIR="/data/user/$USER/patatrack-validation/pulls"
