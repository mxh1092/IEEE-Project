#!/bin/bash
#SBATCH --qos bbdefault
#SBATCH --ntasks=1
#SBATCH --account=mangers-positron-imaging-centre
#SBATCH --time 10:10:00
#SBATCH --mem=10G
#SBATCH --mail-type FAIL

set -e

module purge; module load bluebear
module load Geant4/10.06.p03-foss-2019b
module load GATE/9.0-foss-2019b-Python-3.7.4

source /rds/bear-apps/2019b/EL8-has/software/ROOT/6.20.00-foss-2019b-Python-3.7.4/bin/thisroot.sh
source /rds/bear-apps/2019b/EL8-has/software/Geant4/10.06.p03-foss-2019b/bin/geant4.sh
export PATH=$PATH:/rds/bear-apps/2019b/EL8-has/software/GATE/9.0-foss-2019b-Python-3.7.4/bin

G4DATA=/rds/projects/m/mangers-positron-imaging-centre/Geant4-Data/data
G4NEUTRONHPDATA=/rds/projects/m/mangers-positron-imaging-centre/Geant4-Data/G4NDL4.6
G4RADIOACTIVEDECAYDATA=/rds/projects/m/mangers-positron-imaging-centre/Geant4-Data/RadioactiveDecay5.6
G4LEVELGAMMADATA=/rds/projects/m/mangers-positron-imaging-centre/Geant4-Data/PhotonEvaporation5.7
G4ENSDFSTATEDATA=/rds/projects/m/mangers-positron-imaging-centre/Geant4-Data/G4ENSDFSTATE2.3
G4LEDATA=/rds/projects/m/mangers-positron-imaging-centre/Geant4-Data/G4EMLOW7.13

# act = source activity in MBq
# sep = head seperation in mm. User must add 87 mm to get desired seperatioon
# Example: to get 600 mm total seperation each head must be moved 300 mm, plus 87 mm for the offset in the model
# Thus, "sep" should equal 387 mm


Gate -a [act,$1][sep,$2] runForte.mac

