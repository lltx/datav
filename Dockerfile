FROM registry.cn-shanghai.aliyuncs.com/pig4cloud/pigx:1.8_jre

RUN mkdir -p /datav/img

WORKDIR /datav

ARG JAR_FILE=target/datav-simple.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom"

CMD java -jar app.jar --spring.profiles.active=snapshot $JAVA_OPTS
