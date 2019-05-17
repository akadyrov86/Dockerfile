FROM ubuntu:18.04
MAINTAINER akadyrov86

#Update packages
RUN apt-get update

#Install 'wget' 'unzip' 'git' and 'make'
RUN apt-get install wget unzip git make -y

#Install Golang
RUN wget https://releases.hashicorp.com/consul/1.5.0/consul_1.5.0_linux_amd64.zip
RUN unzip consul_1.5.0_linux_amd64.zip
RUN mv consul /usr/local/bin/

#Expose port 8500
EXPOSE 8500

#Execute the command to run consul agent
CMD ["consul", "agent", -dev", -client", "0.0.0.0"]