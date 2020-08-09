FROM centos:latest
RUN yum install net-tools \
sudo \
vim \
wget \
ncurses -y

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.19.2/prometheus-2.19.2.linux-amd64.tar.gz 
RUN tar -xzf prometheus-2.19.2.linux-amd64.tar.gz
RUN mkdir /etc/prometheus/   && mv /prometheus-2.19.2.linux-amd64/prometheus.yml  /etc/prometheus/prometheus.yml
CMD ["./prometheus-2.19.2.linux-amd64/prometheus","--config.file=/etc/prometheus/prometheus.yml","--storage.tsdb.path=/prometheus/"]

EXPOSE 9090
