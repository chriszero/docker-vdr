FROM mariadb:5.5

WORKDIR /tmp

RUN mkdir -p epglv/src
COPY epglv/* epglv/
COPY epglv/src/* epglv/src/

RUN apt-get update -qq &&\
    apt-get install -qy locales &&\
    echo "Europe/Berlin" > /etc/timezone &&\
    dpkg-reconfigure -f noninteractive tzdata &&\
    echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen; locale-gen &&\
    \
    apt-get install -qy build-essential \
	    mysql-common libmariadbclient-dev libmariadbclient18 zlib1g zlib1g-dev &&\
      \
    cd /tmp/epglv && \
	    make all && \
	    make install &&\
      \
    apt-get remove -qy \
	    build-essential \
	    libmariadbclient-dev zlib1g-dev &&\
      \
    apt-get autoremove -qy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV LANG de_DE.UTF-8  
ENV LANGUAGE de_DE:de  
ENV LC_ALL de_DE.UTF-8

COPY mysqlepgd.cnf /etc/mysql/conf.d/
COPY mysql-first-time.sql /docker-entrypoint-initdb.d/
