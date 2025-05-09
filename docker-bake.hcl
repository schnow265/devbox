group "default" {
  targets = [
    "dvbx-fedora-cpp"
  ]
}

target "dvbx-base-fedora" {
  context = "."
  dockerfile = "docker/fedora.Dockerfile"
  tags = [
    "ghcr.io/schnow265/devbox-fedora-base:latest"
  ]
  target = "devbox_base_fedora"
}

target "dvbx-fedora-nvim" {
  context = "."
  dockerfile = "docker/fedora.Dockerfile"
  tags = [
    "ghcr.io/schnow265/devbox-fedora-nvim:latest"
  ]
  target = "devbox_fedora_nvim"
}

target "dvbx-fedora-cpp" {
  context = "."
  dockerfile = "docker/fedora.Dockerfile"
  tags = [
    "ghcr.io/schnow265/devbox-fedora-cpp:latest"
  ]
  target = "devbox_fedora_cpp"
}

target "dvbx-base-ubuntu" {
  context = "."
  dockerfile = "docker/ubuntu.Dockerfile"
  tags = [
    "ghcr.io/schnow265/devbox-ubuntu-base:latest"
  ]
  target = "devbox_base_ubuntu"
}
