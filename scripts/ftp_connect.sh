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

set -o nounset                              # Treat unset variables as an error

HOST='ftp.promethence.net'
# From Gnome Keyring
USER=$(secret-tool lookup "ftp" "promethence" "stored" "username" | sed "s/'/\\\'/g")
PASS=$(secret-tool lookup "ftp" "promethence" "stored" "password" | sed "s/'/\\\'/g")

# Log into the FTP server
lftp -u "$USER","$PASS" "$HOST"
#lftp -v -c "set ssl:verify-certificate no; open -u '$USER','$PASS' -p 2121 $HOST; mirror -Rnev ./_site/ ./ --ignore-time --parallel=8 --exclude-glob '.git*' --exclude '.git/' --no-perms"
