FROM alpine:3.19

SHELL [ "/bin/ash", "-o", "pipefail", "-c" ]

WORKDIR /root

RUN apk add --no-cache zsh

ARG ZSH_ABBR_TAG=v5.4.1
ARG ZSH_AUTOSUGGESTIONS_TAG=v0.7.0
ARG OH_MY_ZSH_COMMIT=a779d6563ffb2f0093b4b74c8d5ff0982fa3e930

# a779d6563ffb2f0093b4b74c8d5ff0982fa3e930 is a commit on master we'd like to pin for reproducibility
RUN mkdir -p oh-my-zsh zsh-autosuggestions zsh-abbr
RUN wget -O- https://github.com/ohmyzsh/ohmyzsh/archive/${OH_MY_ZSH_COMMIT}.tar.gz | tar xz --strip-components=1 -C oh-my-zsh
RUN wget -O- https://github.com/zsh-users/zsh-autosuggestions/archive/refs/tags/${ZSH_AUTOSUGGESTIONS_TAG}.tar.gz | tar xzv --strip-components=1 -C zsh-autosuggestions
RUN wget -O- https://github.com/olets/zsh-abbr/archive/refs/tags/${ZSH_ABBR_TAG}.tar.gz | tar xz --strip-components=1 -C zsh-abbr

# setup zsh so we can easily test the bug
COPY zshrc .zshrc
COPY zshhistory .zsh_history

CMD [ "/bin/zsh" ]
