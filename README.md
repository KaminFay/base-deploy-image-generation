# base-deploy-image-generation
Simple repository to allow simple base image template generation within digital ocean. For future use in terraform

Current setup allows the user to create a new custom image within digital ocean use within terraform / automated systems. For a look into that check out the repository [here](https://github.com/KaminFay/deploy-dev-env)

## What it generates:
- 1 VM image snapshot
    - This is loaded with docker and a file to let you know it was created with packer.

## Why?

- I wanted a way to be able to configure the base image for terraform deployments without needing to load everything individually on each vm that was created.

## How?

 1. Clone the repository
 2. Install packer.
 3. Duplicate the variable file in the examples folder
    ```
    cp example/variables.template.hcl example/variables.hcl
    ```
 4. Modify the variables file to your liking, including adding your digital ocean api key (Should likely make this an env later)
 5. Validate the packer configuration:
    ```
    packer validate --var-file=./example/variables.hcl .
    ```
6. Run a build:
    ```
    packer build --var-file=./example/variables.hcl .
    ```

## What Next:
- Likely get the image loaded with a few more nice to haves: tools for debugging, better boostrapping outside of a bash script, etc.
- Further user customization and documentation with it.