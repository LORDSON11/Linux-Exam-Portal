#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning up environment for Question $QNO..."

clear_q1() {
  rm -f report.txt
}

clear_q2() {
  rm -f log.txt
}

clear_q3() {
  sudo userdel -r charlie &>/dev/null
}

clear_q4() {
  echo "[Q4] No cleanup required."
}

clear_q5() {
  sudo userdel -r jill &>/dev/null
}

clear_q6() {
  sudo rm -f /home/student/logs/file.log
  sudo rmdir --ignore-fail-on-non-empty /home/student/logs
}

clear_q7() {
  rm -f data.db test_default.db
}

clear_q8() {
  sudo systemctl stop nginx
}

clear_q9() {
  sudo systemctl stop nginx
}

clear_q10() {
  echo "[Q10] No cleanup needed."
}

case "$QNO" in
  1) clear_q1 ;;
  2) clear_q2 ;;
  3) clear_q3 ;;
  4) clear_q4 ;;
  5) clear_q5 ;;
  6) clear_q6 ;;
  7) clear_q7 ;;
  8) clear_q8 ;;
  9) clear_q9 ;;
  10) clear_q10 ;;
  all)
    clear_q1; clear_q2; clear_q3; clear_q4; clear_q5;
    clear_q6; clear_q7; clear_q8; clear_q9; clear_q10 ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

echo "🧹 Cleanup complete for Question $QNO."
exit 0
