#!/bin/bash

#    This file is part of firewall-gather, created by Matt Foreman.
#
#    firewall-gather is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#   firewall-gather is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with firewall-gather.  If not, see <https://www.gnu.org/licenses/>.
# 

source /etc/profile.d/CP.sh

cd /var/log/

mkdir -p "$HOSTNAME"

( echo ">> cphaprob -a if output below" && cphaprob -a if ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> cphaprob stat output below" && cphaprob stat ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> cphaprob -ia list output below" && cphaprob -ia list ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> fw ctl pstat output below" && fw ctl pstat ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> cpstat -f multi_cpu os output below" && cpstat -f multi_cpu os ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> cpwd_admin list output below" && cpwd_admin list ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> ps auxwf output below" && ps auxwf ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> cphaprob show_failover output below" && cphaprob show_failover ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> fw stat output below" && fw stat ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> fwaccel stat output below" && fwaccel stat ) | tee -a /var/log/$HOSTNAME/info.txt

( echo ">> netstat -i output below" && netstat -i ) | tee -a /var/log/$HOSTNAME/info.txt

cp /var/log/messages* /var/log/$HOSTNAME/
cp /var/log/dmesg /var/log/$HOSTNAME/
cp /var/log/boot.log /var/log/$HOSTNAME/
cp $FWDIR/log/fwd.elg* /var/log/$HOSTNAME/
cp $CPDIR/log/cpwd.elg* /var/log/$HOSTNAME/
cp /var/log/dump/usermode/* /var/log/$HOSTNAME/

( echo "Gathering a cpifo " && cpinfo -i -N -z -o /var/log/$HOSTNAME/$HOSTNAME.gz )

cd /var/log/

tar -cvzf "$(uname -n).tar.gz" /var/log/$HOSTNAME/

echo "DONE! The info collected will be under /var/log/ with the firewall hostname prepended to the tar.gz"


