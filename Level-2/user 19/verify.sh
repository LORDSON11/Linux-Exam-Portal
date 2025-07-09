#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

verify_q1() {
  grep -q "dummy.txt" list.txt && echo "1" || echo "0"
}

verify_q2() {
  tail -1 log.txt | grep -q "$(date '+%Y')" && echo "1" || echo "0"
}

verify_q3() {
  grep -q "No such file" error.log && echo "1" || echo "0"
}

verify_q4() {
  [ -f myconfig.cfg ] && echo "1" || echo "0"
}

verify_q5() {
  sudo less /var/log/syslog &>/dev/null && echo "1" || echo "0"
}

verify_q6() {
  perms=$(stat -c "%a" /home/student/bit/build.sh)
  [ "$perms" = "700" ] && echo "1" || echo "0"
}

verify_q7() {
  ls -ld /home/student/bit | grep -q "t" && echo "1" || echo "0"
}

verify_q8() {
  systemctl list-dependencies apache2 | grep -q "network.target" && echo "1" || echo "0"
}

verify_q9() {
  journalctl -u ssh --since "1 day ago" | grep -qE "Accepted|Failed" && echo "1" || echo "0"
}

verify_q10() {
  systemctl list-units --type=service --state=active | grep -q "ssh" && echo "1" || echo "0"
}

case "$QNO" in
  1) verify_q1 ;;
  2) verify_q2 ;;
  3) verify_q3 ;;
  4) verify_q4 ;;
  5) verify_q5 ;;
  6) verify_q6 ;;
  7) verify_q7 ;;
  8) verify_q8 ;;
  9) verify_q9 ;;
  10) verify_q10 ;;
  *) echo "0"; exit 1 ;;
esac

exit 0
