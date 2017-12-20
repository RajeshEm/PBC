#!/usr/bin/expect -f
# This file is copyright of Prolifics 2014. All rights reserved. You are not permitted to copy, modify, or redistribute this file.
# See the readme.txt file for further terms and conditions.

set TARGET_USER [lindex $argv 0]
set TARGET_PASSWORD [lindex $argv 1]
set TARGET_HOST [lindex $argv 2]
set IIB_BROKER [lindex $argv 3]
set IIB_BIN [lindex $argv 4]

spawn ssh $TARGET_USER@$TARGET_HOST ". $IIB_BIN/mqsiprofile && $IIB_BIN/mqsireload $IIB_BROKER"

expect {
authenticity {send "yes\r"; exp_continue}
password: {send "$TARGET_PASSWORD\r"; exp_continue}
eof
}