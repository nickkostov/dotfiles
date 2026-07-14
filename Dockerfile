FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash zsh git curl sudo ca-certificates vim less \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /usr/bin/zsh tester \
    && echo "tester ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/tester \
    && chmod 0440 /etc/sudoers.d/tester \
    && touch /home/tester/.zshrc \
    && chown tester:tester /home/tester/.zshrc

USER tester
WORKDIR /home/tester/.dotfiles

COPY --chown=tester:tester . .

CMD ["/usr/bin/zsh"]