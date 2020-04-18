# awsgluepyspark docker

Docker image with dependencies Spark, PySpark, Hadooop, and awsglue modules to speed the development of [AWS Glue](https://aws.amazon.com/glue/) ETL
scripts. The images are built with the [amazonlinux2 base image](https://hub.docker.com/_/amazonlinux/).

## Supported Tags

* [python3, 3.7, 3, latest](https://github.com/chriswessells/awsgluepyspark/blob/master/AL2/Dockerfile) support for Python 3 with Glue 1.0
* [python, 2.7, 2](https://github.com/chriswessells/awsgluepyspark/blob/master/AL2_2.7/Dockerfile) support for Python 2.7 with Glue 1.0

## Python 3 libs

* Python 3.7.5
* pip3
* Glue 1.0
* pytest

## Python 2 libs

* Python 2.7.5
* pip
* Glue 1.0
* pytest

## Adding libraries

The intended use is to help in automating Analytics workloads using AWS Glue. If you need libraries outside the default list of dependencies innstalled in 
the default endpoints, [AWS Glue supports including packages to extend the builtin functionality.](https://docs.aws.amazon.com/glue/latest/dg/add-job-python.html)

## Building the container

```
git clone https://github.com/chriswessells/awsgluepyspark.git
cd awsgluepyspark/AL2
docker build -t awsgluepyspark .
```

## Manual Test Usage

The assumption is you know how to use Docker locally.

1. Build the container on your local device.
1. Have the path to the pyspark code available.

```
docker run -v /path/to/pyspark:/home/glue --rm -it chriswessells/awsgluepyspark:latest
```

The command above will place you in the glue home directory with your source code. For unit test files
that use awsglue DynamicFrames, or the SparkContext use `gluepytest` to run pytest, otherwise use
pytest.

```
gluepytest tests/<function_name>_test.py
```

The command above will use gluepytest to test the file.

**NOTE:**
*I added gluepytest, gluepyspark, and gluesparksubmit to the container's PATH. You can launch the
container, mounting your working directory and run `gluepytest tests/<name of your file>` and it will
run the tests. If you are not using the awsglue classes or modules just use `pytest`.*

## Using AWS CodeBuild locally

You will n eed to [Setup CodeBuild Agent Locally](https://docs.aws.amazon.com/codebuild/latest/userguide/use-codebuild-agent.html)
before you can move forward. I followed the instructions then renamed `codebuild_build.sh` to 
`codebuild_build`, and made it executable. Then placed the script in my path so I could call it from
anywhere in the filesystem.

Navigate into your Glue scripts folder then run the command:

```
codebuild_build -i chriswessells/awsgluepyspark:latest -a /path/to/artifact/output -s /path/to/scripts
```

It will call the codebuild agent, launch the awsgluepyspark container, and test the Glue scripts.

## Using AWS Developer Tools

You can add the container to your AWS CodeBuild project to run the unittests on your AWS Glue 
scripts. In the CodeBuild project change the container to:

* Custom image
* Linux Environment Type
* Other Registry
* chriswessells/awsgluepyspark:latest

No credientals necessary

## Quick reference

* [Amazon Corretto 8](https://hub.docker.com/_/amazoncorretto) Docker help
* [Setup CodeBuild Agent Locally](https://docs.aws.amazon.com/codebuild/latest/userguide/use-codebuild-agent.html)

## Requirements

* Have docker installed
* Have AWS Glue pyspark code setup for unit testing
