FROM amazoncorretto:latest

ENV glue_spark_url https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-1.0/spark-2.4.3-bin-hadoop2.8.tgz

ENV spark_zip spark-2.4.3-bin-hadoop2.8.tgz

ENV maven_URL https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-common/apache-maven-3.6.0-bin.tar.gz

ENV maven_ZIP apache-maven-3.6.0-bin.tar.gz

ENV glue_repo https://github.com/awslabs/aws-glue-libs

ENV maven_path /usr/local/share/applications/apache-maven-3.6.0/bin

ENV spark_path /usr/local/share/applications/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8/bin

ENV glue_lib /usr/local/share/applications/aws-glue-libs

ENV glue_bin /usr/local/share/applications/aws-glue-libs/bin

ENV SPARK_HOME /usr/local/share/applications/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8

ENV SPARK_CONF_DIR /usr/local/share/applications/aws-glue-libs/conf

ENV GLUE_JARS_DIR $glue_lib/jars

ENV PATH $maven_path:$spark_path:$glue_bin:$PATH

WORKDIR /usr/local/share/applications

RUN yum install -y git wget tar zip pandoc which \
    && python -m ensurepip --default-pip \
    && pip install pytest \
    && adduser glue -d /home/glue -s /bin/bash -m \
    && chown -R glue:glue /home/glue \
    && wget $maven_URL \
    && tar -xzf $maven_ZIP \
    && rm -f apache-maven-3.6.0-bin.tar.gz \
    && wget $glue_spark_url \
    && tar -xzf $spark_zip \
    && rm -f spark-2.4.3-bin-hadoop2.8.tgz \
    && git clone $glue_repo \
    && cd aws-glue-libs \
    && git checkout glue-1.0 \
    && cd $glue_bin \
    && sh glue-setup.sh \
    && sed -e '/mvn/ s/^#*/#/' -i glue-setup.sh \
    && cd ../../ && rm -rf aws-glue-libs/jarsv1/netty-all-4.0.23.Final.jar \
    && cp spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8/jars/netty-all-4.1.17.Final.jar aws-glue-libs/jarsv1/ \
    && chown -R glue:glue /usr/local/share/applications \
    && chown -R glue:glue /usr/local/lib \
    && chown -R glue:glue /usr/local/bin \
    && chown -R glue:glue /usr/local/share

USER glue

WORKDIR /home/glue

ENV PYTHONPATH $SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$glue_lib/PyGlue.zip:$PYTHONPATH
