#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

verify_q1() {
  grep -q "Change has been done" memo.txt && echo "1" || echo "0"
}

verify_q2() {
  grep -q "No such file" all_output.log && grep -q "/home/student" all_output.log && echo "1" || echo "0"
}

verify_q3() {
  sudo passwd -S zack | grep -q "P" && echo "1" || echo "0"
}

verify_q4() {
  grep -q "ls -l" /home/steve/.bash_history && echo "1" || echo "0"
}

verify_q5() {
  sudo chage -l sarah | grep -q "Account expires.*2025-06-30" && echo "1" || echo "0"
}

verify_q6() {
  perms=$(stat -c "%a" /home/student/bit/credentials.txt)
  [ "$perms" = "000" ] && echo "1" || echo "0"
}

verify_q7() {
  perms=$(stat -c "%a" /home/student/bit/shared)
  [[ "$perms" == 27* ]] && echo "1" || echo "0"
}

verify_q8() {
  systemctl show nginx --property=ActiveEnterTimestamp | grep -q "ActiveEnterTimestamp" && echo "1" || echo "0"
}

verify_q9() {
  journalctl -b | grep -q "systemd" && echo "1" || echo "0"
}

verify_q10() {
  journalctl -u nginx -n 20 | grep -qE "nginx|Active" && echo "1" || echo "0"
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
