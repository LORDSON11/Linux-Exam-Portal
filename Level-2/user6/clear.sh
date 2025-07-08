#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning up for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/logs/log.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/logs
}

clear_q2() {
  sudo rm -f /home/student/data/data.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/data
}

clear_q3() {
  sudo rm -f /home/student/errors.txt
}

clear_q4() {
  echo "No files to clean for Q4 (just reads /etc/passwd)"
}

clear_q5() {
  echo "No files to clean for Q5 (group lookup only)"
}

clear_q6() {
  sudo rm -f /home/student/bit/file1.txt /home/student/bit/file2.txt
}

clear_q7() {
  sudo rm -f /home/student/bit/test_umask.txt
}

clear_q8() {
  sudo rm -f /home/student/bit/runme.sh
}

clear_q9() {
  if systemctl is-enabled telnet &>/dev/null || systemctl is-active telnet &>/dev/null; then
    echo "Stopping and unmasking telnet service..."
    sudo systemctl stop telnet
    sudo systemctl unmask telnet
  fi
}

clear_q10() {
  echo "Masking telnet service again for cleanup..."
  sudo systemctl mask telnet
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

echo "Cleanup complete for Question $QNO"
exit 0
