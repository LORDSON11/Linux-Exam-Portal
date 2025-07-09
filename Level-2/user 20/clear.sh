#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning environment for Question $QNO..."

clear_q1() {
  rm -f memo.txt
}

clear_q2() {
  rm -f all_output.log
}

clear_q3() {
  sudo userdel -r zack &>/dev/null
}

clear_q4() {
  sudo userdel -r steve &>/dev/null
}

clear_q5() {
  sudo userdel -r sarah &>/dev/null
}

clear_q6() {
  rm -f /home/student/bit/credentials.txt
}

clear_q7() {
  rm -rf /home/student/bit/shared
}

clear_q8() {
  sudo systemctl stop nginx
  sudo apt purge -y nginx &>/dev/null
}

clear_q9() {
  echo "[Q9] No cleanup needed."
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

echo " Cleanup complete for Question $QNO."
exit 0
