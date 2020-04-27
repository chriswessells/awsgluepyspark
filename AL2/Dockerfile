FROM amazoncorretto:latest

ENV glue_spark_url https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-1.0/spark-2.4.3-bin-hadoop2.8.tgz

ENV spark_zip spark-bin-hadoop.tgz

ENV maven_url https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-common/apache-maven-3.6.0-bin.tar.gz

ENV maven_zip apache-maven-bin.tar.gz

ENV glue_repo https://github.com/awslabs/aws-glue-libs

ENV maven_path /usr/local/share/applications/apache-maven

ENV glue_lib /usr/local/share/applications/aws-glue-libs

ENV SPARK_HOME /usr/local/share/applications/spark-home

ENV SPARK_CONF_DIR /usr/local/share/applications/aws-glue-libs/conf

ENV GLUE_JARS_DIR $glue_lib/jars

ENV PATH $maven_path/bin:$SPARK_PATH/bin:$glue_lib/bin:$PATH

WORKDIR /usr/local/share/applications

RUN yum install -y git wget python3 tar zip pandoc which gcc python3-devel postgresql-devel \
    && pip3 install pytest boto3 numpy scipy pandas PyGreSQL scikit-learn \
    && adduser glue -d /home/glue -s /bin/bash -m \
    && chown -R glue:glue /home/glue \
    && wget $maven_url -O $maven_zip \
    && mkdir -p $maven_path && tar -xzf $maven_zip --strip-components=1 --directory $maven_path \
    && rm -f $maven_zip \
    && wget $glue_spark_url -O $spark_zip \
    && mkdir -p $SPARK_HOME && tar -xzf $spark_zip --strip-components=1 --directory $SPARK_HOME \
    && rm -f $spark_zip \
    && git clone $glue_repo \
    && cd aws-glue-libs \
    && git checkout glue-1.0 \
    && cd $glue_lib/bin \
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

ENV PYSPARK_DRIVER_PYTHON python3

ENV PYSPARK_PYTHON python3

ENV PYTHONPATH $SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$glue_lib/PyGlue.zip:$PYTHONPATH
