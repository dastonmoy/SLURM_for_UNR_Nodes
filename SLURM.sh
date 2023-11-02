#!/bin/bash

# Naming the job
#SBATCH -J JOBNAME_Bla_Bla

# Specifying the account
#SBATCH -A seylabi

# Specifying the partition/server/node where the job will run
#SBATCH -p seylabi

# Requesting number of CPU cores (XXXX) for the job
#SBATCH -n XXXX

# Requesting XXXX GiBs of RAM for the job
#SBATCH --mem XXXXG

# Expected time to finish the job; format: days-hours:minutes:seconds
#SBATCH --time 7-00:00:00

# Setting the working directory for the job
#SBATCH -D /home/NetID/workingdirectory

# Requesting email notifications for all job events
# Available options: NONE, BEGIN, END, FAIL, REQUEUE, TIME_LIMIT, STAGE_OUT
#SBATCH --mail-type=END

# Specifying where email notifications should be sent (add your email address, keep blank if you don't want any notifications)
#SBATCH --mail-user=

# Respecifying the working directory to run the job
cd /home/NetID/workingdirectory

# Load your own modules here
# Example: module load another_module_name/version
ml purge
ml openmpi/4.0.5-gcc-10.3.0
ml ls-dyna/14.0.0

# Set your own environmental variables here
export LSTC_LICENSE=network
export LSTC_LICENSE_SERVER=license-0.engr.unr.edu

# Running the job, modelname.k using OpenMPI with XXXX cores calling ls-dyna v14.0
# and saving the output as a text file named output.txt inside the working directory

srun -n XXXX --mpi pmix mpirun ls-dyna i=/home/NetID/workingdirectory/modelname.k>>output.txt