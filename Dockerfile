FROM mcr.microsoft.com/dotnet/sdk:6.0
ARG CHROME_VERSION 99.0.4844.84
# Install Chrome
RUN apt-get update && apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg \
hicolor-icon-theme \
libcanberra-gtk* \
libgl1-mesa-dri \
libgl1-mesa-glx \
libpango1.0-0 \
libpulse0 \
libv4l-0 \
fonts-symbola \
--no-install-recommends \
&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
&& apt-get update && apt-get install -y \
google-chrome-stable \
--no-install-recommends \
&& apt-get purge --auto-remove -y curl \
&& rm -rf /var/lib/apt/lists/* 

#latest version
# && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
# && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
# && apt-get update && apt-get install -y \
# google-chrome-stable \
# --no-install-recommends \

#depends lib ... so  custom download version and manual convert
#&& wget https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_$CHROME_VERSION-1_amd64.deb \
#&& dpkg -i google-chrome-stable_$CHROME_VERSION-1_amd64.deb \
#&& rm google-chrome-stable_$CHROME_VERSION-1_amd64.deb \
