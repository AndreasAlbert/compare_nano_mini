# Step 1: Picking a miniaod file

You can run the instruction below based on any MiniAOD file. By default, let's use:

```
/store/mc/RunIIFall17MiniAODv2/WJetsToLNu_HT-400To600_TuneCP5_13TeV-madgraphMLM-pythia8/MINIAODSIM/PU2017_12Apr2018_94X_mc2017_realistic_v14-v1/60000/D4B85997-515A-E811-84D5-0025905C54B8.root
```

you can retrieve this file to your local working area using 

```bash
xrdcp root://cms-xrd-global.cern.ch///store/mc/RunIIFall17MiniAODv2/WJetsToLNu_HT-400To600_TuneCP5_13TeV-madgraphMLM-pythia8/MINIAODSIM/PU2017_12Apr2018_94X_mc2017_realistic_v14-v1/60000/D4B85997-515A-E811-84D5-0025905C54B8.root .
```


# Step 2: Generating NanoAOD from the chosen file

```bash
./run_nano_v5.sh file:D4B85997-515A-E811-84D5-0025905C54B8.root
cmsRun nano_v5_cfg.py
```

This will create an output file with the same name, but a tag `_nanov5` attached.


# Step 3: Running nanoaod-tools

Set up the nanoaod-tools repository:

```bash
cmsrel CMSSW_10_6_0;
cd CMSSW_10_6_0/src;
cmsenv;

cd ${CMSSW_BASE}/src
git clone https://github.com/AndreasAlbert/nanoAOD-tools.git PhysicsTools/NanoAODTools -b monojet_27Oct19
cd PhysicsTools/NanoAODTools
cmsenv
scram b
```

And run the code:

```bash
cd ${CMSSW_BASE}/src/PhysicsTools/NanoAODTools/crab/

python crab_script_monojet.py \
        dataset=WJetsToLNu_HT-400To600_TuneCP5_13TeV-madgraphMLM-pythia8_2017\
        file=/path/to/D4B85997-515A-E811-84D5-0025905C54B8_nanov5.root \
        ismc=true \
        year=2017 \
        test=true \
        nofilter=true \
```

The output will be a file with the `_Skim` tag attached to its name. This file is at the same stage that we would use in the analysis. The branch names mean the same things (e.g. `Jet_pt_nom` is the JER-corrected jet pt.)

# Step 4: Run the MiniAOD-based script 

TODO

# Step 5: Make a comparison

TODO