Core Infra
==========
This configures several core infrastructure services that are used to provide
basic functionality to the Kubernetes cluster.

This project configures the following:

- An offline root CA and an intermediate CA used to bootstrap the Vault
  instance
- OpenEBS for automatic provisioning of HostPath volumes mapped into the host OS
  on platforms like Docker for Mac
- An instance of HashiCorp Vault for secrets management
