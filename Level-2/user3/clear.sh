#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Starting cleanup for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/data/largefile.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/data
}

clear_q2() {
  sudo rm -f /home/student/docs/summary.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/docs
}

clear_q3() {
  sudo rm -f /home/student/reports/report.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/reports
}

clear_q4() {
  sudo userdel -r bob &>/dev/null
}

clear_q5() {
  sudo userdel -r susan &>/dev/null
}

clear_q6() {
  sudo rm -f /home/student/bit/config.ini
  sudo userdel admin &>/dev/null
  sudo groupdel admins &>/dev/null
}

clear_q7() {
  sudo rm -rf /home/student/bit/team
  sudo groupdel projectx &>/dev/null
}

clear_q8() {
  sudo rm -f /home/student/bit/summary.txt
}

clear_q9() {
  echo "Manual service cleanup for nginx not included."
}

clear_q10() {
  echo "Manual service cleanup for apache2 not included."
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

echo "Environment cleaned for Question $QNO"
exit 0
