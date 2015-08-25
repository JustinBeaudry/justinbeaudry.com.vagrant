#!/usr/bin/env bash

# DEPS
ok yum kernel-dev
ok yum perl
ok yum make
ok yum gcc
ok yum gcc-c++
ok yum openssh-server
ok yum git
ok yum vim-enhanced
ok yum lsof

# SSHD
ok file /etc/ssh/ssh_config /etc/bolt/manifest/ssdh_config
if bolt_did_update; then
  systemctl restart sshd
fi

# ULIMITS
ok file /etc/security/limits.conf /etc/bolt/manifest/server/limits.conf

# NTP
ok yum ntp
if bolt_did_update; then
  systemctl start ntpd
  systemctl enable ntpd
fi

# FIREWALL
systemctl stop firewalld
chkconfig firewalld off

# NETWORK
ok file /etc/hosts /etc/bolt/manifest/network/hosts

# ROOT DOTFILES
ok file /root/.bash_profile  /etc/bolt/manifest/user/dotfiles/bash_profile
ok file /root/.bashrc        /etc/bolt/manifest/user/dotfiles/bashrc
ok file /root/.editorconfig  /etc/bolt/manifest/user/dotfiles/editorconfig
ok file /root/.gitconfig     /etc/bolt/manifest/user/dotfiles/gitconfig
ok file /root/.inputrc       /etc/bolt/manifest/user/dotfiles/inputrc
ok file /root/.vimrc         /etc/bolt/manifest/user/dotfiles/vimrc
ok file /root/.npmrc         /etc/bolt/manifest/user/dotfiles/npmrc

# ROOT SSH
ok dir /root/.ssh
ok file /root/.ssh/config    /etc/bolt/manifest/user/ssh/config

# ROOT VIM
ok file /root/.vim/vimrc                    /etc/bolt/manifest/user/vim/vimrc
ok file /root/.vim/autoload/pathogen.vim    /etc/bolt/manifest/user/vim/autoload/pathogen.vim
ok file /root/.vim/colors/Tomorrow.vim      /etc/bolt/manifest/user/vim/colors/Tomorrow.vim

# VAGRANT DOTFILES
ok file /home/vagrant/.bash_profile   /etc/bolt/manifest/user/dotfiles/bash_profile  --owner vagrant --group admin
ok file /home/vagrant/.basrc          /etc/bolt/manifest/user/dotfiles/bashrc        --owner vagrant --group admin
ok file /home/vagrant/.editorconfig   /etc/bolt/manifest/user/dotfiles/editorconfig  --owner vagrant --group admin
ok file /home/vagrant/.inpurc         /etc/bolt/manifest/user/dotfiles/inputrc       --owner vagrant --group admin
ok file /home/vagrant/.vimrc          /etc/bolt/manifest/user/dotfiles/vimrc         --owner vagrant --group admin
ok file /home/vagrant/.npmrc          /etc/bolt/manifest/user/dotfiles/npmrc         --owner vagrant --group admin

# VAGRANT SSH
ok dir /home/vagrant/.ssh
ok file /home/vagrant/.ssh/config     /etc/bolt/manifest/user/ssh/condig             --owner vagrant --group admin

# VAGRANT VIM
ok file /home/vagrant/.vim/vimrc                    /etc/bolt/manifest/user/vim/vimrc
ok file /home/vagrant/.vim/autoload/pathogen.vim    /etc/bolt/manifest/user/vim/autoload/pathogen.vim
ok file /home/vagrant/.vim/colors/Tomorrow.vim      /etc/bolt/manifest/user/vim/colors/Tomorrow.vim

source $HOME/.bashrc

# NGINX
ok yum nginx
rm -f /etc/nginx/conf.d/example_ssl.conf
rm -f /etc/nginx/conf.d/default.conf


