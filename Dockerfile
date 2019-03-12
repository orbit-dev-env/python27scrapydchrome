FROM vimagick/scrapyd:latest

RUN	apt-get update && \
    apt-get install -y --no-install-recommends unzip wget curl unzip fontconfig xvfb libgconf2-4 imagemagick && \
	  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list && \
	  apt-get update && \
	  apt-get -y install --no-install-recommends  google-chrome-stable

RUN	wget https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip && \
	  unzip chromedriver_linux64.zip -d /usr/bin/
