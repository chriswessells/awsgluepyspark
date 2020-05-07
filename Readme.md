# Supported Tags

* [python3, 3.7, 3, latest](https://github.com/chriswessells/awsgluepyspark/blob/master/AL2/Dockerfile) support for
Python 3 with Glue 1.0
* [python, 2.7, 2](https://github.com/chriswessells/awsgluepyspark/blob/master/AL2_2.7/Dockerfile) support for Python
2.7 with Glue 1.0

## Quick Reference

* [AWS Glue Developer Documentation](https://docs.aws.amazon.com/glue/latest/dg/what-is-glue.html)
* [Testing AWS CodeBuild locally](https://docs.aws.amazon.com/codebuild/latest/userguide/use-codebuild-agent.html)
* [Adding external Python packages to AWS Glue Scripts](https://docs.aws.amazon.com/glue/latest/dg/add-job-python.html)

## What is the awsgluepyspark container

Docker image with dependencies Spark, PySpark, Hadooop, and awsglue modules to speed the development of
[AWS Glue](https://aws.amazon.com/glue/) ETL scripts. The images are built with the
[amazonlinux2 base image](https://hub.docker.com/_/amazonlinux/).

AWSGluePySpark is a Docker container where you can run AWS Glue PySpark scripts. The AWSGluePySpark container is one
piece of a larger process of applying the Test Driven Development (TDD) processes to developing AWS Glue scripts. The
TDD process can increase the velocity when developing software.

You can retrieve the docker image from docker hub:
- https://hub.docker.com/r/chriswessells/awsgluepyspark

## Python 3 libs

* Python 3.7.5
* pip3
* Glue 1.0
* pytest
* boto3
* scipy
* numpy
* pandas
* PyGreSQL
* scikit-learn

## Python 2 libs

* Python 2.7.5
* pip
* Glue 1.0
* pytest
* boto3
* scipy
* numpy
* pandas
* PyGreSQL
* scikit-learn

## Adding libraries

The intended use is to help in automating Analytics workloads using AWS Glue. If you need libraries outside the default
list of dependencies installed in the default endpoints,
[AWS Glue supports including packages](https://docs.aws.amazon.com/glue/latest/dg/add-job-python.html) to extend the
builtin functionality.

## testing code with the container

Download the docker container for your version of Python. A how-to for testing AWS Glue scripts are outside the scope.
I included enough details for you to fill in the gaps and understand how the container works.

### AWS Glue testing commands

Container PATH includes the commands to test the glue scripts.

* gluepytest
* gluepyspark
* gluesparksubmit

### Strategies to test scripts

Instructions to setup environments are outside the scope of this repo.

* [AWS CodeBuild Agent Locally](https://docs.aws.amazon.com/codebuild/latest/userguide/use-codebuild-agent.html)
* [Microsoft Visual Studio Code remote coding](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Contact

If there is a problem using the container feel free to open an issue.

* [Chris Wessells](https://github.com/chriswessells)
* [Open issue](https://github.com/chriswessells/awsgluepyspark/issues)
