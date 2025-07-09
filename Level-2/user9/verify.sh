#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

echo "Verifying environment for Question $QNO..."

verify_q1() {
  FILE="/home/student/logs/system_check.txt"
  grep -Fxq "System check completed successfully." "$FILE" && echo "Q1: Verified." || echo "Q1: Verification failed."
}

verify_q2() {
  FILE="/home/student/docs/instructions.txt"
  head -n 3 "$FILE" >/dev/null && tail -n 4 "$FILE" >/dev/null && echo "Q2: Verified." || echo "Q2: Verification failed."
}

verify_q3() {
  FILE="/home/student/notes/history.txt"
  grep -q -- "-- Updated on final review." "$FILE" && echo "Q3: Verified." || echo "Q3: Verification failed."
}

verify_q4() {
  FILE="/home/student/data.txt"
  [ "$(stat -c %G $FILE)" = "staff" ] && echo "Q4: Verified." || echo "Q4: Verification failed."
}

verify_q5() {
  OUT=$(cut -d: -f1,3,4 /etc/passwd)
  [[ "$OUT" == *":"*":"* ]] && echo "Q5: Verified." || echo "Q5: Verification failed."
}

verify_q6() {
  FILE="/home/student/bit/secret.txt"
  [ "$(stat -c %a $FILE)" = "000" ] && echo "Q6: Verified." || echo "Q6: Verification failed."
}

verify_q7() {
  FILE="/home/student/bit/report.txt"
  [ -w "$FILE" ] && echo "Q7: Verified." || echo "Q7: Verification failed."
}

verify_q8() {
  FILE="/home/student/bit/db.conf"
  ls -l "$FILE" && echo "Q8: Verified." || echo "Q8: Verification failed."
}

verify_q9() {
  journalctl -p err | grep -q "." && echo "Q9: Verified." || echo "Q9: No error logs found (or journalctl not available)."
}

verify_q10() {
  dmesg | grep -q "." && echo "Q10: Verified." || echo "Q10: No kernel logs found."
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
  all)
    verify_q1; verify_q2; verify_q3; verify_q4; verify_q5
    verify_q6; verify_q7; verify_q8; verify_q9; verify_q10
    ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

exit 0
