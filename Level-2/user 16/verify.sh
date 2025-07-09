#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

verify_q1() {
  grep -Fxq "Meeting at 10 AM" /home/student/memos/reminder.txt && echo "1" || echo "0"
}

verify_q2() {
  [ -f /home/student/library/ebook.txt ] && echo "1" || echo "0"
}

verify_q3() {
  [ "$(id -gn roger 2>/dev/null)" = "developers" ] && echo "1" || echo "0"
}

verify_q4() {
  lastlog | grep -q -iE "roger|alex|lucy" && echo "1" || echo "0"
}

verify_q5() {
  grep -q "^alex:[^!*]" /etc/shadow && echo "1" || echo "0"
}

verify_q6() {
  finger lucy &>/dev/null && echo "1" || echo "0"
}

verify_q7() {
  [ "$(stat -c %a /home/student/bit/file.txt)" = "644" ] && echo "1" || echo "0"
}

verify_q8() {
  find /home/student/bit -type f -perm 0777 | grep -q "openfile" && echo "1" || echo "0"
}

verify_q9() {
  journalctl -u ssh &>/dev/null && echo "1" || echo "0"
}

verify_q10() {
  systemctl status nginx &>/dev/null && echo "1" || echo "0"
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
