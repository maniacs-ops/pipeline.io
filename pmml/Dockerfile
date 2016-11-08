FROM fluxcapacitor/package-java-1.8

WORKDIR /root

COPY src/ src/
COPY build.sbt build.sbt
COPY lib/ lib/

RUN \
  sbt clean package 

RUN \
  mkdir -p /root/logs

ENV LOGS_HOME=/root/logs

COPY run run

#RUN \
#  wget http://search.maven.org/remotecontent?filepath=org/scala-sbt/sbt-launch/1.0.0-M4/sbt-launch-1.0.0-M4.jar -O /root/sbt-launch.jar

EXPOSE 9040 

CMD ["supervise", "."]
