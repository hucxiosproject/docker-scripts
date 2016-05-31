FROM jenkins
USER root
##RUN apt-get update && apt-get install -y ruby

ENV GRADLE_VERSION 2.7
ENV GRADLE_HASH fe801ce2166e6c5b48b3e7ba81277c41
WORKDIR /usr/lib
RUN wget https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
RUN echo "${GRADLE_HASH} gradle-${GRADLE_VERSION}-bin.zip" > gradle-${GRADLE_VERSION}-bin.zip.md5
RUN md5sum -c gradle-${GRADLE_VERSION}-bin.zip.md5
RUN unzip "gradle-${GRADLE_VERSION}-bin.zip"
RUN ln -s "/usr/lib/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle
RUN rm "gradle-${GRADLE_VERSION}-bin.zip"
ENV GRADLE_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_HOME/bin
RUN apt-get update && apt-get install -y ruby
RUN apt-get install -y openssh-client && apt-get install -y openssh-server && apt-get install -y vim
USER jenkins

ENV GRADLE_VERSION 2.7
ENV GRADLE_HASH fe801ce2166e6c5b48b3e7ba81277c41
WORKDIR /usr/lib
ENV GRADLE_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_HOME/bin