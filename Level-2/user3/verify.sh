#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

verify_q1() {
  [ -f "/home/student/data/largefile.txt" ] && echo "1" || echo "0"
}

verify_q2() {
  [ -f "/home/student/docs/summary.txt" ] && echo "1" || echo "0"
}

verify_q3() {
  head -n 10 /home/student/reports/report.txt &>/dev/null && echo "1" || echo "0"
}

verify_q4() {
  sudo passwd -S bob 2>/dev/null | grep -q 'L' && echo "1" || echo "0"
}

verify_q5() {
  sudo passwd -S susan 2>/dev/null | grep -q 'P' && echo "1" || echo "0"
}

verify_q6() {
  owner=$(stat -c "%U" /home/student/bit/config.ini 2>/dev/null)
  group=$(stat -c "%G" /home/student/bit/config.ini 2>/dev/null)
  [[ "$owner" = "admin" && "$group" = "admins" ]] && echo "1" || echo "0"
}

verify_q7() {
  group=$(stat -c "%G" /home/student/bit/team 2>/dev/null)
  [ "$group" = "projectx" ] && echo "1" || echo "0"
}

verify_q8() {
  perms=$(ls -l /home/student/bit/summary.txt 2>/dev/null)
  [[ "$perms" == -* ]] && echo "1" || echo "0"
}

verify_q9() {
  systemctl is-active nginx &>/dev/null && echo "1" || echo "0"
}

verify_q10() {
  systemctl show apache2 --property=ExecReload | grep -q 'reload' && echo "1" || echo "0"
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
