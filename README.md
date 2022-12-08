# Puppet LAB

[Docker HUB](https://hub.docker.com/repository/docker/viceo/puppet-lab)

This project has been created to easily and quickly learn how to configure a simple puppet setup.

# Build
```bash
$ podman build \
    -f Containerfile \
    -t [optional tag] \
    .
```

# Run
```bash
$ podman run -itd \
    --rm --privileged \
    --hostname puppet \
    --name puppet \
    [hash|tag]
```

# Versions
Path | Version
:--- | ---:
puppet | 7.20
puppetserver | 7.9.2
facter | 7.2.13
hiera | 3.10.0
pxp-agent | 1.15.17


