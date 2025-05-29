#!/bin/bash - 
#===============================================================================
#
#          FILE: ftp_send.sh
#
#         USAGE: ./ftp_send.sh 
#
#        AUTHOR: Simone Perriello
#  ORGANIZATION: Promethence SRL
#       CREATED: 15/05/2025 10:34
#      REVISION:  1.0
#===============================================================================

export JEKYLL_ENV=production
export RUBY_VERSION="3.3.7"

if [ -z "$RBENV_SHELL" ] && [ -z "$RVM_PROJECT_PATH" ]; then
    echo "Neither rbenv nor rvm is initialized. Exiting."
    echo "Try to run 'eval \"\$(rbenv init -)\"' "
    echo "or"
    echo "source \"\$HOME/.rvm/scripts/rvm\" "
    exit 1
fi

set -o nounset                              # Treat unset variables as an error
# Build site
bundle exec jekyll build --incremental
# Hard deletion of blog
if [[ -d "_site/blog" ]] ; then
    rm -r _site/blog
fi

# Purge unused css
# purgecss -c purgecss.config.js
HOST='ftp.promethence.net'

# Retrieve the password from GNOME Keyring
USER=$(secret-tool lookup "ftp" "promethence" "stored" "username" | sed "s/'/\\\'/g")
PASS=$(secret-tool lookup "ftp" "promethence" "stored" "password" | sed "s/'/\\\'/g")
if [ -z "$PASS" ]; then
  echo "Password not found in secret-tool. Make sure it's stored correctly."
  exit 1
fi
echo "FTP connection..."

lftp -v -c "set ssl:verify-certificate no; open -u $USER,'$PASS' -p 21 $HOST; mirror -Rnev ./_site/ ./www.promethence.net/ --ignore-time --parallel=8 --exclude-glob '.git*' --exclude '.git/' --no-perms"

echo "Deployed successfully!"
