FROM nodered/node-red

WORKDIR /usr/src/node-red
USER root

RUN apk update \
&& apk add git \
#alpine-sdk \
build-base \
gcc \
python3 \
python3-dev \
py3-pip \
py3-virtualenv

# Install wiringpi
#RUN pip install pyserial
#WORKDIR /opt/wiringPi
#RUN git clone git://git.drogon.net/wiringPi .
#RUN chown -R node-red:node-red /opt/wiringPi
#RUN git pull origin && ./build
#RUN pip install wiringpi2

# Install python rpi - TODO find way to install documentation
RUN pip install RPi.GPIO

# Install bcm2835 library
#WORKDIR /usr/local/lib
#RUN curl http://www.airspayce.com/mikem/bcm2835/bcm2835-1.56.tar.gz | tar xz && \
#  cd bcm2835-1.* && \
#  ./configure && \
#  make && make install

WORKDIR /usr/src/node-red

#install admin script
RUN npm install node-red-admin \
&& npm install node-red-contrib-gpio \
&& npm install node-red-contrib-tradfri \
&& npm install node-red-dashboard \
&& npm install node-red-contrib-ifttt \
&& npm install node-red-contrib-google-home-notify \
&& npm install node-red-contrib-gpio \
&& npm install node-red-contrib-redis \
&& npm install node-red-node-email 
