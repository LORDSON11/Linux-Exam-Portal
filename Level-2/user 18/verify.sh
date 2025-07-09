#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

verify_q1() {
  [ "$(wc -l < report.txt)" -ge 100 ] && echo "1" || echo "0"
}

verify_q2() {
  [ "$(wc -l < log.txt)" -ge 100 ] && echo "1" || echo "0"
}

verify_q3() {
  chage -l charlie | grep -q "Password expires.*never" && echo "1" || echo "0"
}

verify_q4() {
  awk -F: '$3 < 1000 {print $1}' /etc/passwd | grep -qE "^(root|daemon|bin|sys|sync|games|man|lp)" && echo "1" || echo "0"
}

verify_q5() {
  getent passwd jill | cut -d: -f5 | grep -q "Jill" && echo "1" || echo "0"
}

verify_q6() {
  perms=$(namei -l /home/student/logs/file.log | tail -n 1 | awk '{print $1}')
  echo "$perms" | grep -q "rw" && echo "1" || echo "0"
}

verify_q7() {
  umask_val=$(umask)
  touch test_default.db
  actual_perm=$(stat -c %a test_default.db)
  expected_perm=$((666 - 8#$umask_val))
  [ "$actual_perm" -eq "$expected_perm" ] && echo "1" || echo "0"
}

verify_q8() {
  systemctl is-active nginx | grep -q "active" && echo "1" || echo "0"
}

verify_q9() {
  systemctl is-active nginx | grep -q "active" && echo "1" || echo "0"
}

verify_q10() {
  systemctl --failed | grep -q "loaded failed" && echo "1" || echo "0"
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
