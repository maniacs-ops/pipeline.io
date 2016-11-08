FROM fluxcapacitor/package-ubuntu-14.04

WORKDIR /root

ENV \
 TENSORFLOW_VERSION=0.10.0 \
 TENSORFLOW_SERVING_VERSION=0.4.1 \
 SPRING_CORE_VERSION=4.3.0.RELEASE \
 SPRING_BOOT_VERSION=1.3.5.RELEASE \
 SPRING_CLOUD_VERSION=1.1.2.RELEASE \
 SPRING_CLOUD_DEPENDENCIES=Brixton.RC1 
 
# TensorFlow Serving Home (not required on PATH)
ENV \
  TENSORFLOW_SERVING_HOME=/root/serving

# TensorFlow Home (not required on PATH)
#ENV TENSORFLOW_HOME=/root/tensorflow

# Java (required by bazel)
#RUN \
# apt-get update \
# && apt-get install -y software-properties-common \
# && add-apt-repository ppa:webupd8team/java \
# && apt-get update \
# && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
# && apt-get install -y oracle-java8-installer \
# && apt-get install -y oracle-java8-set-default

#RUN \
#  echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list \
#  && curl https://bazel.io/bazel-release.pub.gpg | sudo apt-key add - \
#  && apt-get update \
#  && apt-get install -y bazel

# Required by TensorFlow Serving
RUN \
 apt-get update \
 && apt-get install -y \
      build-essential \
      libfreetype6-dev \
      libpng12-dev \
      libzmq3-dev \
      pkg-config \
      python-dev \
      python-numpy \
      python-pip \
      software-properties-common \
      swig \
      zip \
      zlib1g-dev \
      libcurl3-dev

RUN pip install enum34 futures mock six && \
    pip install --pre 'protobuf>=3.0.0a3' && \
    pip install -i https://testpypi.python.org/simple --pre grpcio

RUN \
  echo "build --spawn_strategy=standalone --genrule_strategy=standalone" >>/root/.bazelrc

ENV \
  BAZELRC=/root/.bazelrc

ENV \ 
  BAZEL_VERSION=0.3.2
#  JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre

RUN add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jdk openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN \ 
  mkdir /root/bazel \
  && cd /root/bazel \
  && curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh \
  && curl -fSsL -o /root/bazel/LICENSE.txt https://raw.githubusercontent.com/bazelbuild/bazel/master/LICENSE.txt \
  && chmod +x bazel-*.sh \
  && ./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh \
  && rm bazel-$BAZEL_VERSION-installer-linux-x86_64.sh

# TensorFlow Serving
RUN \
 cd ~ \
 && git clone -b $TENSORFLOW_SERVING_VERSION --single-branch --recurse-submodules https://github.com/tensorflow/serving.git

RUN \
  cd ~/serving/tensorflow \
  && ./configure

RUN \
  cd ~/serving \
  && bazel build -c opt tensorflow_serving/...

#
# TensorFlow Source
#RUN \
# cd ~ \
# && git clone -b v$TENSORFLOW_VERSION --single-branch --recurse-submodules https://github.com/tensorflow/tensorflow.git

#COPY setup-tensorflow-serving.sh setup-tensorflow-serving.sh
#RUN \
#  cd ~ \
#  && ./setup-tensorflow-serving.sh

#COPY sidecar/ sidecar/
#RUN \
# cd /root/sidecar \
# && mvn -DskipTests clean install

RUN \
  mkdir -p /root/logs

ENV 
  \LOGS_HOME=/root/logs

COPY run run
COPY datasets/ datasets/

RUN \
  cd /root/datasets/serving/inception_model \
  && tar -xzvf 00157585.tgz \
  && rm 00157585.tgz

RUN \
  mkdir -p /root/tensorboard 

COPY tensorflow-inception-serving-service-proxy.py tensorflow-inception-serving-service-proxy.py

EXPOSE 6006 5070 5678 9090 9091

CMD ["supervise", "."]
