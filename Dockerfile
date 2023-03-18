FROM ubuntu:22.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y autoconf automake bison bzip2 chrpath coreutils cpio curl cvs debianutils default-jre default-jre-headless diffstat flex g++ gawk gcc gcc-12 gcc-multilib g++-multilib gettext git git-core gzip help2man info iputils-ping java-common libc6-dev libegl1-mesa libglib2.0-dev libncurses5-dev libperl4-corelibs-perl libproc-processtable-perl libsdl1.2-dev libserf-dev libtool libxml2-utils make ncurses-bin patch perl pkg-config psmisc python3 python3-git python3-jinja2 python3-pexpect python3-pip python-setuptools qemu quilt socat sshpass subversion tar texi2html texinfo unzip wget xsltproc xterm xz-utils zip zlib1g-dev zstd fakeroot lz4

RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1 && update-alternatives --install /usr/bin/python python /usr/bin/python3 2

RUN echo "dash dash/sh boolean false" | debconf-set-selections && dpkg-reconfigure -f noninteractive dash

RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -n -w fs.inotify.max_user_watches=524288

RUN useradd -ms /bin/bash openatvbuilder

#RUN apt install -y locales && locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locale
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt update && apt install -y screen
USER openatvbuilder

WORKDIR /openatvbuilder/openatv

#RUN git clone https://github.com/oe-alliance/build-enviroment.git -b 5.2

#RUN cd build-enviroment && make update

