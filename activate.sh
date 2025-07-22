if [[ ${HOSTNAME} =~ ^.*bridges2.psc.edu$ ]]
then
    echo "I'm on PSC Bridges2 => Activating pre-production modules"
    ml use /opt/packages/julia/modules
else
    echo "I'm on NERSC Perlmutter => Activating pre-production modules"
    ml use /global/common/software/nersc9/julia/modules 
fi
