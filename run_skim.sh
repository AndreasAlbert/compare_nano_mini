pushd CMSSW_10_2_5/src;
eval `scramv1 runtime -sh`
popd

SCRIPT=${CMSSW_BASE}/src/PhysicsTools/NanoAODTools/crab/crab_script_monojet.py

python $SCRIPT \
        dataset=WJetsToLNu_HT-400To600_TuneCP5_13TeV-madgraphMLM-pythia8_2017\
        file=D4B85997-515A-E811-84D5-0025905C54B8_nanov5.root \
        ismc=true \
        year=2017 \
        test=true
