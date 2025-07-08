#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

verify_q1() {
  [ -f "/home/student/data/longfile.txt" ] && echo "1" || echo "0"
}

verify_q2() {
  if [ -f "/home/student/marks.txt" ]; then
    lines=$(wc -l < /home/student/marks.txt)
    [ "$lines" -eq 5 ] && echo "1" || echo "0"
  else
    echo "0"
  fi
}

verify_q3() {
  grep -q "Important system information" /home/student/info.txt && echo "1" || echo "0"
}

verify_q4() {
  id "anna" &>/dev/null && [ -d "/home/anna" ] && echo "1" || echo "0"
}

verify_q5() {
  full_name=$(getent passwd alice | cut -d ':' -f 5 | cut -d ',' -f 1)
  [ "$full_name" = "Alice Smith" ] && echo "1" || echo "0"
}

verify_q6() {
  perms=$(stat -c "%A" /home/student/bit/deploy.sh 2>/dev/null)
  [[ "$perms" == ?rwx?x??* ]] && echo "1" || echo "0"
}

verify_q7() {
  perms=$(stat -c "%A" /home/student/bit/budget.xls 2>/dev/null)
  [[ "$perms" == ????????- ]] && echo "1" || echo "0"
}

verify_q8() {
  owner=$(stat -c "%U" /home/student/bit/report.docx 2>/dev/null)
  [ "$owner" = "john" ] && echo "1" || echo "0"
}

verify_q9() {
  systemctl is-enabled docker &>/dev/null && echo "1" || echo "0"
}

verify_q10() {
  systemctl is-enabled bluetooth &>/dev/null
  [ $? -eq 1 ] && echo "1" || echo "0"
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
