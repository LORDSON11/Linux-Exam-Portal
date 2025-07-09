#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning environment for Question $QNO..."

clear_q1() {
  rm -f dummy.txt list.txt
}

clear_q2() {
  rm -f log.txt
}

clear_q3() {
  rm -f script.sh error.log
}

clear_q4() {
  rm -f myconfig.cfg
}

clear_q5() {
  sudo rm -f /var/log/syslog
}

clear_q6() {
  rm -f /home/student/bit/build.sh
}

clear_q7() {
  chmod -t /home/student/bit
}

clear_q8() {
  sudo apt purge -y apache2 &>/dev/null
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
