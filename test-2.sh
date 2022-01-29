#!/bin/sh
set -eu
create_git_ssh_command() {
    [ ! -x "$git_ssh" ] || return 0

    cat > "$git_ssh" <<EOF
#!/bin/sh
exec ssh -o BatchMode=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "\$@"
EOF
    chmod a+x "$git_ssh"
}

clone_repository() {
    local url="$1"
    local clone_dir="$2"
    local git_dir="$3"

    rm -rf "$clone_dir" && create_git_ssh_command && \
        GIT_SSH="$git_ssh" git clone --no-checkout "$url" "$clone_dir" && \
        mv "$clone_dir/.git" "$git_dir" && rmdir "$clone_dir"
}

if [[ "$PRIVATE_REPO" == "true" ]];then
  # Using deploy key to access Github private repository
  # Private key for deploy key, NOT your personal private key!
  # This part is not necessary if repository public
  echo -e "-----BEGIN RSA PRIVATE KEY-----
...INSERT PRIVATE KEY AS DEPLOY KEY HERE...
-----END RSA PRIVATE KEY-----" > /root/.ssh/id_rsa

  # Public key for deploy keys
  # This part is not necessary if repository public
  echo -e "...INSERT PUBLIC KEY FOR DEPLOY KEY HERE..." > /root/.ssh/id_rsa.pub

  echo -e "# GitLab.com server
Host gitlab.com
PubkeyAuthentication yes
IdentityFile /root/.ssh/id_rsa
StrictHostKeyChecking no
UserKnownHostsFile=/dev/null" > ~/.ssh/config

  cd /root/
  chmod 700 .ssh/
  chmod 644 .ssh/authorized_keys
  chmod 644 .ssh/known_hosts
  chmod 644 .ssh/id_rsa.pub
  chmod 600 .ssh/id_rsa

  # Start SSH agent
  eval $(ssh-agent -s)
  ssh-add /root/.ssh/id_rsa
  # SSH Host Key Checking
  ssh-keyscan -H github.com >> /root/.ssh/known_hosts

  #test connection
  ssh -T git@github.com
  # test deploy key Fingerprint
  ssh-add -l -E md5

  # Clone repository
  cd /home/debian/;
  git clone git@github.com:bio-platform/bio-class-deb10.git bio-class 2>&1 > /home/debian/gitclone.txt

  # Delete deploy key
  rm -rf /root/.ssh/id_rsa*

  # Deletes all identities from the agent
  ssh-add -D