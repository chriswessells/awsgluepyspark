# awsgluepyspark container

## Supported tags

* `latest`, `AL2x8664` - Built from Amazon Corretto 8

## Quick reference

* [Amazon Corretto 8](https://hub.docker.com/_/amazoncorretto) Docker help
* [Setup CodeBuild Agent Locally](https://docs.aws.amazon.com/codebuild/latest/userguide/use-codebuild-agent.html)

## Running the container

I added gluepytest, gluepyspark, and gluesparksubmit to the container's PATH. You can launch the
container, mounting your working directory and run `gluepytest tests/<name of your file>` and it will
run the tests. If you are not using the awsglue classes or modules just use `pytest`.

You can add the container to your AWS CodeBuild project to run the unittests on your AWS Glue 
scripts.
