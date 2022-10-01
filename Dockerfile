FROM ubuntu:20.04

# Install packages without prompting the user to answer any questions
ENV DEBIAN_FRONTEND=noninteractive

#####################################################
# Install common apt packages
#####################################################
RUN apt-get update && apt-get install -y \
	### utility
	locales \
	xterm \
	dbus-x11 \
	terminator \
	sudo \
	## tools
	unzip \
	lsb-release \
	curl \
	ffmpeg \
	net-tools \
	software-properties-common \
	subversion \
	libssl-dev \
	### Development tools
	build-essential \
	htop \
	git \
	vim \
	gedit \
	gdb \
	valgrind \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*



#####################################################
# python3.8 related
#####################################################
RUN apt-get update && apt-get install -y \
	python3-distutils \
	python3-testresources

RUN apt-get update && \
	apt-get install -y wget && \
	wget https://bootstrap.pypa.io/get-pip.py && \
	python3.8 get-pip.py


#####################################################
# Set locale & time zone
#####################################################
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ=Asia/Tokyo


#####################################################
# Run scripts (commands)
#####################################################

### terminator window settings
COPY assets/config /

### user group settings
COPY assets/entrypoint_setup.sh /
ENTRYPOINT ["/entrypoint_setup.sh"] /

# Run terminator
CMD ["terminator"]