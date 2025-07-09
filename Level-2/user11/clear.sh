#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Clearing environment for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/reports/overview.txt
  echo "Q1: Removed /home/student/reports/overview.txt"
}

clear_q2() {
  sudo rm -f /home/student/logs/logfile.txt
  echo "Q2: Removed /home/student/logs/logfile.txt"
}

clear_q3() {
  sudo userdel -r chris &>/dev/null || true
  echo "Q3: User chris deleted"
}

clear_q4() {
  echo "Q4: No cleanup needed"
}

clear_q5() {
  sudo userdel -r tina &>/dev/null || true
  echo "Q5: User tina deleted"
}

clear_q6() {
  sudo rm -f /home/student/bit/dev/start.sh
  sudo rmdir /home/student/bit/dev 2>/dev/null || true
  echo "Q6: Removed /home/student/bit/dev/start.sh"
}

clear_q7() {
  sudo rm -f /home/student/.config/.settings /home/student/.config/.profile
  echo "Q7: Removed hidden files in /home/student/.config"
}

clear_q8() {
  echo "Q8: No cleanup needed"
}

clear_q9() {
  echo "Q9: No cleanup needed"
}

clear_q10() {
  echo "Q10: No cleanup needed"
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
