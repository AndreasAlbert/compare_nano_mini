#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_2_15/src ] ; then 
 echo release CMSSW_10_2_15 already exists
else
scram p CMSSW CMSSW_10_2_15
fi
cd CMSSW_10_2_15/src
eval `scram runtime -sh`

INPUTFILE=${1}

if [ -z $INPUTFILE ]; then
    echo "Need to provide input file as argument!"
    exit 1
fi


OUTPUTFILE=$(echo $INPUTFILE | sed 's/.root/_nanov5.root/')
scram b
cd ../../
cmsDriver.py step1  \
            --filein "${INPUTFILE}" \
            --fileout file:"${OUTPUTFILE}" \
            --mc  \
            --eventcontent NANOEDMAODSIM  \
            --datatier NANOAODSIM  \
            --conditions 102X_mc2017_realistic_v7  \
            --step NANO  \
            --nThreads 1  \
            --era Run2_2017,run2_nanoAOD_94XMiniAODv2  \
            --python_filename nano_v5_cfg.py  \
            --no_exec  \
            --customise Configuration/DataProcessing/Utils.addMonitoring \
            -n 100 || exit $?;

