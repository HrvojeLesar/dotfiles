#!/usr/bin/bash

sudo sh -c "cat > /etc/systemd/system/swapoff-before-shutdown.service" <<EOF
[Unit]
Description=swapoff partition before shutdown

[Service]
Type=oneshot
RemainAfterExit=true
ExecStop=/usr/bin/swapoff --all
TimeoutSec=60

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable swapoff-before-shutdown.service
sudo systemctl start swapoff-before-shutdown.service
