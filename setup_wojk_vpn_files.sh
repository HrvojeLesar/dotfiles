#!/usr/bin/bash

sudo cp ./dotfiles/wojk/systemd/cemix-vpn.service /etc/systemd/system/cemix-vpn.service
sudo cp ./dotfiles/wojk/systemd/hlesar-vpn.service /etc/systemd/system/hlesar-vpn.service

sudo cp ./dotfiles/wojk/openvpn/2304_factory_dev@leo-fw.leonex.de.ovpn /etc/openvpn/client
sudo cp ./dotfiles/wojk/openvpn/factory-vpn.ovpn /etc/openvpn/client
sudo cp ./dotfiles/wojk/openvpn/hlesar.ovpn /etc/openvpn/client
sudo cp ./dotfiles/wojk/openvpn/leonexpass /etc/openvpn/client

echo "10.11.12.1 fade01.factory.vpn fade01.vpn fade01
10.11.12.2 proxy01.factory.vpn proxy01
10.11.12.3 mysql01.factory.vpn mysql01
10.11.12.4 phobos.factory.vpn phobos
10.11.12.5 area51.factory.vpn area51
10.11.12.6 luna.factory.vpn luna
10.11.12.7 rek.factory.vpn rek
10.11.12.8 gitlab.factory.vpn git.factory.vpn gitlab git
10.11.12.9 atalanta.factory.vpn atalanta runner gitrunner
10.11.12.10 phoenix.factory.vpn phoenix backup.factory.vpn backup
" | sudo tee -a /etc/hosts
