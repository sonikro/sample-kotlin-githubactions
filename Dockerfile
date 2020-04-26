FROM gradle:6.3.0-jdk8 AS builder
RUN mkdir /app
WORKDIR /app
COPY . .
RUN gradle clean assemble

FROM adoptopenjdk/openjdk13-openj9:jdk-13.0.2_8_openj9-0.18.0-alpine-slim
COPY --from=builder /app/build/libs/kotlin-githubactions-sample-*-all.jar kotlin-githubactions-sample.jar
EXPOSE 8080
CMD ["java", "-Dcom.sun.management.jmxremote", "-Xmx128m", "-XX:+IdleTuningGcOnIdle", "-Xtune:virtualized", "-jar", "kotlin-githubactions-sample.jar"]
