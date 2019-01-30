# GLPK

Installs the [GNU Linear Programming Kit](https://www.gnu.org/software/glpk/)
bin and lib into an AWS Lambda layer.

## Usage
To use this layer in your lambda function we must first deploy it to AWS. These steps require Docker be installed on your workstation.

The `build.sh` script will create a ZIP file which will become our layer.

The `publish.sh` script will then publish this as a layer to all regions.

You will then be able to attach this layer to your function; through the Lambda Console or AWS CLI.
