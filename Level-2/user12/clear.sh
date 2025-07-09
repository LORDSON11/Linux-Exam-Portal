#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

clear_q1() {
  sudo rm -f /home/student/analysis/output.txt
  echo "Q1 cleanup: Removed output.txt"
}

clear_q2() {
  sudo rm -f /home/student/data/data.txt
  echo "Q2 cleanup: Removed data.txt"
}

clear_q3() {
  sudo userdel -r laura &>/dev/null || true
  echo "Q3 cleanup: Removed user laura"
}

clear_q4() {
  sudo userdel -r olivia &>/dev/null || true
  echo "Q4 cleanup: Removed user olivia"
}

clear_q5() {
  sudo userdel -r luke &>/dev/null || true
  echo "Q5 cleanup: Removed user luke"
}

clear_q6() {
  sudo rm -f /home/student/work/project.txt
  echo "Q6 cleanup: Removed project.txt"
}

clear_q7() {
  sudo rm -f /home/student/bit/doc1.txt /home/student/bit/doc2.txt
  echo "Q7 cleanup: Removed files in /home/student/bit"
}

clear_q8() {
  echo "Q8 cleanup: No action needed."
}

clear_q9() {
  echo "Q9 cleanup: No action needed."
}

clear_q10() {
  echo "Q10 cleanup: No action needed."
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
