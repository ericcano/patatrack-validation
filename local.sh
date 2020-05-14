# Local CMSSW installation
VO_CMS_SW_DIR=/data/cmssw

# OAuth token to post comments on GitHub
OAUTH_FILE=$HOME/.patatrack-validation.oauth

# Local cache of the input files
LOCAL_CACHE_PATH=/gpu_data

# Local cache of the input files
TTBAR_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_0_0_patch1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU_110X_mcRun3_2021_realistic_v6-v1/20000"
TTBAR_CACHE_FILE="0788CFB2-4391-3244-B51C-2A9822597230.root,9B51A025-66BF-C645-879F-47FC85DAA492.root"
ZMUMU_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_0_0_patch1/RelValZMM_14/GEN-SIM-DIGI-RAW/110X_mcRun3_2021_realistic_v6-v1/20000"
ZMUMU_CACHE_FILE="F087E365-7BDE-6A4A-A8EC-D52AD264CA94.root,621DA197-EEB1-084C-849D-8CEA9956CDA5.root"
ZEE_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/relval/CMSSW_11_0_0_patch1/RelValZEE_14/GEN-SIM-DIGI-RAW/110X_mcRun3_2021_realistic_v6-v1/20000"
ZEE_CACHE_FILE="5C1F59D1-D27F-2340-9BC4-7B04083AC7B8.root,DCA40C94-EF28-514C-8518-30909831802B.root"

L1ACCEPT_CACHE_PATH="file:$LOCAL_CACHE_PATH/store/data/Run2018D/EphemeralHLTPhysics1/RAW/v1/000/323/775/00000"
L1ACCEPT_CACHE_FILE="A27DFA33-8FCB-BE42-A2D2-1A396EEE2B6E.root"

# URL and local area for uploading validation plots, profiles and logs
UPLOAD_URL="https://patatrack.web.cern.ch/patatrack/validation/pulls"
UPLOAD_DIR="/eos/home-f/fpantale/www/patatrack-website/validation/pulls"
LOCAL_DIR="/data/user/$USER/patatrack-validation/pulls"
