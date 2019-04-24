FROM crown0726/orbit-python27node8:latest

RUN	apt-get update && \
	apt-get install -y --no-install-recommends unzip wget curl unzip fontconfig xvfb libgconf2-4 imagemagick && \
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list && \
	apt-get update && \
	apt-get -y install --no-install-recommends google-chrome-stable

RUN	wget https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip && \
	unzip chromedriver_linux64.zip -d /usr/bin/

# Install pip pkgs
RUN	pip install scrapy fake-useragent && \
	pip install scrapyd

# copy some files
COPY	.scrapyd.conf /root/.scrapyd.conf
COPY	IPAfont00303.zip /data/IPAfont00303.zip

# ???
RUN	unzip /data/IPAfont00303.zip -d /usr/share/fonts/ && \
	fc-cache -fv
