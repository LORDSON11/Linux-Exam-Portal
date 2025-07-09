#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

clear_q1() {
  rm -f /home/student/logs/session.log
  echo "Q1 cleanup: Removed session.log"
}

clear_q2() {
  > /home/student/projects/readme.txt
  echo "Q2 cleanup: Emptied readme.txt"
}

clear_q3() {
  sudo usermod -U olga 2>/dev/null
  echo "Q3 cleanup: Unlocked user olga"
}

clear_q4() {
  echo "Q4 cleanup: No action needed (view-only command)"
}

clear_q5() {
  echo "Q5 cleanup: No action needed (view-only command)"
}

clear_q6() {
  chmod -t /home/student/bit 2>/dev/null
  echo "Q6 cleanup: Removed sticky bit from /home/student/bit"
}

clear_q7() {
  chmod -g-s /home/student/bit 2>/dev/null
  echo "Q7 cleanup: Removed SGID from /home/student/bit"
}

clear_q8() {
  echo "Q8 cleanup: No action needed (view-only command)"
}

clear_q9() {
  sudo systemctl set-default graphical.target 2>/dev/null
  echo "Q9 cleanup: Reset default target to graphical.target"
}

clear_q10() {
  sudo systemctl set-default graphical.target 2>/dev/null
  echo "Q10 cleanup: Reset default target to graphical.target"
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
