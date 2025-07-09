#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear14.sh <question_number|all>"; exit 1; }

clear_q1() {
  rm -f /home/student/data/data.csv
  echo "Q1 cleanup done"
}

clear_q2() {
  rm -f /home/student/reports/summary.txt /home/student/reports/linecount.txt
  echo "Q2 cleanup done"
}

clear_q3() {
  sudo userdel -r brian2025 &>/dev/null || sudo userdel -r brian &>/dev/null || true
  echo "Q3 cleanup done"
}

clear_q4() {
  sudo userdel -r frank &>/dev/null || true
  sudo groupdel testgrp &>/dev/null
  echo "Q4 cleanup done"
}

clear_q5() {
  sudo userdel -r emma &>/dev/null || true
  echo "Q5 cleanup done"
}

clear_q6() {
  rm -f /home/student/bit/access.key
  echo "Q6 cleanup done"
}

clear_q7() {
  rm -f /home/student/share/feedback.txt
  echo "Q7 cleanup done"
}

clear_q8() {
  echo "Q8: No cleanup required"
}

clear_q9() {
  sudo systemctl set-default graphical.target
  echo "Q9: Target reverted to graphical"
}

clear_q10() {
  echo "Q10: No cleanup required"
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

echo "Cleanup complete for Question $QNO"
exit 0
