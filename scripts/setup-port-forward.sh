#!/bin/bash

cat <<EOF | sudo pfctl -ef -
rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 30080
rdr pass inet proto tcp from any to any port 443 -> 127.0.0.1 port 30443
rdr pass inet proto tcp from any to any port 389 -> 127.0.0.1 port 30389
rdr pass inet proto tcp from any to any port 636 -> 127.0.0.1 port 30636
EOF
