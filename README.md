# patatrack-validation
Scripts and tools for the validation of the Patatrack developments

## `validate`
The `validate` script is used to
  - create working areas for a reference release (e.g. `CMSSW_10_1_0`), and a development release or branch (e.g. `CMSSW_10_1_X_Patatrack`);
  - if one ore more PRs are specified, create a working area based on the development release, merge them and build;
  - run various cmsDriver.py workflows on existing RelVals;
  - upload the resulting DQM plots to the development GUI;
  - upload the results of `makeTrackValidationPlots.py` to a web area on EOS;
  - produce a markdown report with relevant links.

Note: this script relies on `visDQMUpload` and `visDQMUtils.py` being available in the same directory.
If they are missing they are automatically downloaded from https://github.com/rovere/dqmgui/ .

## More information
For more information on Patatrack, see https://patatrack.web.cern.ch/patatrack/ .  
For more insormation on CMSSW, see https://cms-sw.github.io/ .
