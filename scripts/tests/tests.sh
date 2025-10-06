# SANITY CHECK tests
# This is a temporary solution. We want something more standard than a custom script 
# in the future.
# This tests could take a large amount of time

VERSION=1.0.2


# Config sanity checks
echo "spack version found: $(spack --version | grep $VERSION | wc -l)"
echo "gcc 11 compiler found: $(spack compilers | grep gcc@11 | wc -l)"
echo "gcc 10 compiler found: $(spack compilers | grep gcc@10 | wc -l)"
echo "cce 15 compilers found: $(spack compilers | grep cce@15 | wc -l)"

# Check we can build and run a few example packages
spack -d install -vvv lammps
spack -d install -vvv quantum-espresso

# Check that we can run a package on the compute nodes
#sbatch -W submit_lammps.sh
#cat lammps_test.out