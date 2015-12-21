FROM felix/openjdk
RUN ["echo", "2015-12-21"]
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "curl", "make", "git", "ruby", "rake", "tree"]

# Set the default locale to UTF-8
RUN [ "locale-gen", "en_US.UTF-8" ]
RUN [ "echo", "LANG=en_US.UTF-8", ">>", "/etc/default/locale" ]

WORKDIR /workspace
VOLUME "/workspace/target"

# Bump the date argument to force install-dependencies to run again
RUN [ "/workspace/bin/install-dependencies", "2015-12-21" ]
