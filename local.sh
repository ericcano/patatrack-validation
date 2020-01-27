# Local CMSSW installation
VO_CMS_SW_DIR=/data/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/gpu_data

# Local cache of the input files
TTBAR_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_0_0_pre12/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_110X_upgrade2018_realistic_v7_forTrk-v1/20000"
TTBAR_CACHE_FILE="1BE1059E-3728-F448-96AD-9E168A049F34.root,844CBC34-B52A-1244-A57C-5582CAF2B79A.root"
ZMUMU_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_0_0_pre12/RelValZMM_13/GEN-SIM-DIGI-RAW/110X_upgrade2018_realistic_v7_forTrk-v1/20000"
ZMUMU_CACHE_FILE="817EDE89-5965-DF4D-8D3D-42598D9D76ED.root,555D4344-7BD9-ED44-9E28-19DF091A70B7.root"
TTBARDESIGN_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_0_0_pre12/RelValTTbar_13/GEN-SIM-DIGI-RAW/PU25ns_110X_upgrade2018_design_v3_forTrk-v1/20000"
TTBARDESIGN_CACHE_FILE="EBD8BE04-B65C-5347-942A-2C48E2FF2487.root,29AB9558-2926-B347-B5B2-640EC9185394.root"

L1ACCEPT_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/data/Run2018D/EphemeralHLTPhysics1/RAW/v1/000/323/775/00000"
L1ACCEPT_CACHE_FILE="A27DFA33-8FCB-BE42-A2D2-1A396EEE2B6E.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://patatrack.web.cern.ch/patatrack/validation/pulls"
UPLOAD_DIR="/eos/home-f/fpantale/www/patatrack-website/validation/pulls"
LOCAL_DIR="/data/user/$USER/patatrack-validation/pulls"
