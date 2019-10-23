# Default global tag and number of events
GLOBALTAG="106X_upgrade2018_realistic_v4"
NUMEVENTS=100

# Datasets used as input for the matrix-like tests
SAMPLES="TTBAR ZMUMU TTBARDESIGN"

# Data samples
DATA_SAMPLES="L1ACCEPT"

# TTbar sample, with "realistic" conditions and 50 pileup
TTBAR="/RelValTTbar_13/CMSSW_10_6_0-PU25ns_106X_upgrade2018_realistic_v4-v1/GEN-SIM-DIGI-RAW"
TTBAR_NUMEVENTS=100

# Z -> mumu sample, with "realistic" conditions and no pileup
ZMUMU="/RelValZMM_13/CMSSW_10_6_0-PU25ns_106X_upgrade2018_realistic_v4-v1/GEN-SIM-DIGI-RAW"
ZMUMU_NUMEVENTS=200

# TTbar sample, with "design" conditions and 50 pileup
TTBARDESIGN="/RelValTTbar_13/CMSSW_10_6_0-PU25ns_106X_upgrade2018_design_v3-v1/GEN-SIM-DIGI-RAW"
TTBARDESIGN_NUMEVENTS=100
TTBARDESIGN_GLOBALTAG="106X_upgrade2018_design_v3"

# Level-1 Trigger selected events, from Run2018D data taking era, pileup 50
L1ACCEPT="/EphemeralHLTPhysics1/Run2018D-v1/RAW run=323775 lumi=53"
L1ACCEPT_NUMEVENTS=4200
L1ACCEPT_GLOBALTAG="auto:run2_hlt"
