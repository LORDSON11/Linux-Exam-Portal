#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Starting cleanup for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/notices/announcement.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/notices
}

clear_q2() {
  sudo rm -f /home/student/reports/report.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/reports
}

clear_q3() {
  sudo rm -f doc_list.txt
}

clear_q4() {
  sudo userdel -r john &>/dev/null
  sudo rm -rf /home/john
}

clear_q5() {
  sudo userdel -r mike &>/dev/null
  sudo rm -rf /home/mike
}

clear_q6() {
  sudo rm -f /home/student/bit/cleanup.sh
}

clear_q7() {
  sudo rm -f /home/student/bit/personal_notes.txt
}

clear_q8() {
  sudo rm -f /home/student/bit/policy.pdf
}

clear_q9() {
  if systemctl is-active --quiet apache2; then
    echo "Stopping apache2 service..."
    sudo systemctl stop apache2
  else
    echo "apache2 service not running."
  fi
}

clear_q10() {
  if systemctl is-active --quiet ssh; then
    echo "Stopping ssh service..."
    sudo systemctl stop ssh
  else
    echo "ssh service not running."
  fi
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
    clear_q1
    clear_q2
    clear_q3
    clear_q4
    clear_q5
    clear_q6
    clear_q7
    clear_q8
    clear_q9
    clear_q10
    ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

echo "Environment cleaned for Question $QNO"
exit 0
