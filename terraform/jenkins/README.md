Jenkins
=======
This Terraform project configures a Jenkins server using the stable Jenkins
Helm chart.

Dependencies
============
- `cert-manager`
- `jenkins-storage`
- `nginx-ingress`

Known Issues
============
When accessed on port 30443, Jenkins keeps redirecting to URLs on port 443.
for now, use the `scripts/setup-port-forward.sh` script to configure a forward
from port 443 to port 30443.
