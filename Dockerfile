FROM ubuntu:14.04

ARG USER_ID
ARG GROUP_ID

ENV HOME /home/sperocoin

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}

RUN groupadd -g ${GROUP_ID} sperocoin \
	&& useradd -u ${USER_ID} -g sperocoin -s /bin/bash -m -d ${HOME} sperocoin

RUN set -ex \
	&& apt-get update \
	&& apt-get install -qq --no-install-recommends ca-certificates \
	&& apt-get install -y libboost-all-dev libdb5.3-dev libdb5.3++-dev libminiupnpc-dev \
	&& rm -rf /var/lib/apt/lists/*

# install sperocoin binaries
COPY /bin/sperocoind /usr/local/bin/

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]