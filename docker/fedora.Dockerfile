FROM quay.io/fedora/fedora-toolbox:40 AS devbox_base_fedora

ARG NAME=devbox-fedora
ARG VERSION=40
LABEL com.github.containers.toolbox="true" \
    name="$NAME" \
    version="$VERSION" \
    usage="This image is meant to be used with the toolbox(1) command"

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf upgrade --refresh -y && dnf install -y dnf-plugins-core

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf copr enable dejan/lazygit -y && \
    dnf copr enable atim/starship -y

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf install lazygit starship git -y

RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc
RUN mkdir -p ~/.config

ADD https://github.com/schnow265/containerfiles.git ~/dotfiles

RUN ln -s ~/dotfiles/configs/starship.toml ~/.config/starship.toml

FROM devbox_base_fedora AS devbox_fedora_nvim
RUN git clone https://github.com/schnow265/lazyVim.git ~/.config/nvim

FROM devbox_base_fedora AS devbox_fedora_cpp
ENV CC="clang" CXX="clang++"

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf groupinstall "Development Tools" "Development Libraries" -y && \
    dnf install -y clang clang-tools-extra cmake
