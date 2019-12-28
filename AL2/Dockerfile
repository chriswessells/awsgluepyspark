FROM amazonlinux:2

RUN yum install -y java-sdk git python3 wget tar zip pandoc

RUN adduser glue -d /home/glue -s /bin/bash -m && chown -R glue:glue /home/glue 

ENV glue_spark_url https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-1.0/spark-2.4.3-bin-hadoop2.8.tgz

ENV spark_zip spark-2.4.3-bin-hadoop2.8.tgz

ENV maven_URL https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-common/apache-maven-3.6.0-bin.tar.gz

ENV maven_ZIP apache-maven-3.6.0-bin.tar.gz

ENV glue_repo https://github.com/awslabs/aws-glue-libs

WORKDIR /usr/local/share/applications

RUN git clone $glue_repo && cd aws-glue-libs && git checkout glue-1.0

RUN wget $maven_URL && tar -xzf $maven_ZIP && rm -f apache-maven-3.6.0-bin.tar.gz

RUN wget $glue_spark_url && tar -xzf $spark_zip && rm -f spark-2.4.3-bin-hadoop2.8.tgz

RUN chown -R glue:glue /usr/local/share/applications

USER glue

ENV maven_path /usr/local/share/applications/apache-maven-3.6.0/bin

ENV spark_path /usr/local/share/applications/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8/bin

ENV glue_libs /usr/local/share/applications/aws-glue-libs/bin

ENV SPARK_HOME /usr/local/share/applications/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8

ENV JAVA_HOME /usr/lib/jvm/java

ENV PATH $maven_path:$spark_path:$glue_libs:$PATH

RUN echo '# alias python3' >> /home/glue/.bashrc && echo 'alias python=python3' >> /home/glue/.bashrc

RUN echo '# alias pip3' >> /home/glue/.bashrc && echo 'alias pip=pip3' >> /home/glue/.bashrc

RUN cd $glue_libs && bash glue-setup.sh

WORKDIR /home/glue

RUN cp -rf /usr/local/share/applications/aws-glue-libs/awsglue .
