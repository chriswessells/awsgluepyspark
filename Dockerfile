FROM amazonlinux:2

ENV glue_spark_url https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-1.0/spark-2.4.3-bin-hadoop2.8.tgz

ENV spark_zip spark-2.4.3-bin-hadoop2.8.tgz

ENV maven_URL https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-common/apache-maven-3.6.0-bin.tar.gz

ENV maven_ZIP apache-maven-3.6.0-bin.tar.gz

ENV glue_repo https://github.com/awslabs/aws-glue-libs

RUN yum install -y java-sdk git python3 wget tar zip

ENV JAVA_HOME /usr/lib/jvm/java

WORKDIR /usr/local/share/applications

RUN git clone $glue_repo && cd aws-glue-libs && git checkout glue-1.0

RUN wget $maven_URL && tar -xzf $maven_ZIP

RUN wget $glue_spark_url && tar -xzf $spark_zip

ENV maven_path /usr/local/share/applications/apache-maven-3.6.0/bin

ENV spark_path /usr/local/share/applications/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8/bin

ENV SPARK_HOME /usr/local/share/applications/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8

ENV glue_libs /usr/local/share/applications/aws-glue-libs/bin

ENV PATH $maven_path:$spark_path:$glue_libs:$PATH

RUN mkdir /home/user

WORKDIR /home/user

RUN gluesparksubmit

#COPY *.py .
