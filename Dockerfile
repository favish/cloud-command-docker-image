FROM favish/php-fpm:3.0.4

RUN apt-get update \
  && apt-get install -y \
  vim \
  curl \
  git-core \
  zsh \
  wget \
  curl \
  dnsutils \
  openssh-client \
  lftp \
  cron \
  && rm -rf /var/lib/apt/lists/*

RUN php -r "readfile('https://getcomposer.org/installer');" | php \
  && mv composer.phar /usr/local/bin/composer

# Install and configure OhMyZSH
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
    && sed -i -e "s/bin\/bash/bin\/zsh/" /etc/passwd \
    && echo "echo \"===========================================================\"" >> ~/.bashrc \
    && echo "echo \"This container has zsh installed, use that instead of bash!\"" >> ~/.bashrc \
    && echo "echo \"===========================================================\"" >> ~/.bashrc

# Add a simple vimrc for highlighting and numbers
RUN echo "set number\nsyntax on" > ~/.vimrc

# Adjust ZSH a bit to make where you are a bit more clear
COPY ./welcome.sh /opt/welcome.sh
COPY ./custom-prompt.sh /opt/custom-prompt.sh
RUN echo "source /opt/welcome.sh" >> ~/.zshrc \
    && cat /opt/custom-prompt.sh >> ~/.zshrc

ENV SHELL="/bin/zsh" \
    TERM="xterm" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    PATH="/var/www/vendor/bin:${PATH}"

RUN mkdir -p /var/www/docroot
WORKDIR /var/www/docroot

COPY ./init_database.sh /opt/init_database.sh

CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"]
