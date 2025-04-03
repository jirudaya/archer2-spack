import tools.modules
import os
import argparse

if __name__ == "__main__":

    default_repo= os.path.join( os.path.dirname(tools.__file__) , "..", ".." ) # repository location deduced by the location of this file

    parser = argparse.ArgumentParser(
                    prog='Spack module generator',
                    description='Generates a module for the spack installation. The module set environment variables that point to the local configuration',
                    epilog='')
    
    parser.add_argument('--repo_root',default=default_repo, help="Location of the root of the spack repo.")
    parser.add_argument('version',type=str,help="Version of spack to install.")
    parser.add_argument('--output',type=str,default=".",help="Directory where to save the module files.")
    parser.add_argument('--module',default="spack",help="Which module to generate",choices=["spack","cse_env"],type=str)
    

    args=parser.parse_args()


    if args.module == "spack":
        gen=tools.modules.spack_module_generator(repo_path= args.repo_root,version= args.version)
        gen.write_module(args.output)
    
    if args.module == "cse_env":
        gen=tools.modules.cse_env_module_generator(repo_path= args.repo_root,version=args.version)
        gen.write_module(args.output)
    