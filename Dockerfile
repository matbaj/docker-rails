FROM ubuntu:14.04
MAINTAINER RailsMasters

RUN apt-get update
RUN apt-get -y install git gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libsqlite3-dev vim screen curl wget nodejs openssh-server libpq-dev

RUN mkdir /var/run/sshd

RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd
RUN mkdir /root/.ssh/
ADD ./files/authorized_keys /root/.ssh/authorized_keys
EXPOSE 22
EXPOSE 3000

RUN adduser --disabled-password --gecos "" deployer
USER deployer
RUN mkdir /home/deployer/.ssh/
ADD ./files/authorized_keys /home/deployer/.ssh/authorized_keys
ADD ./files/deployer /home/deployer/.ssh/deployer
RUN chmod 600 /home/deployer/.ssh/deployer
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3

RUN curl -sSL https://get.rvm.io | bash -s stable
RUN bash --login -c "rvm autolibs disable"
RUN bash --login -c "rvm install 2.0"

USER root
RUN mkdir /srv/http/
RUN chown -hR deployer:deployer /srv/http/
CMD /usr/sbin/sshd -D
