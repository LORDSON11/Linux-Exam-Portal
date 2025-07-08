#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Starting cleanup for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/data/longfile.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/data
}

clear_q2() {
  sudo rm -f /home/student/marks.txt
}

clear_q3() {
  sudo rm -f /home/student/info.txt
}

clear_q4() {
  sudo userdel -r anna &>/dev/null
  sudo rm -rf /home/anna
}

clear_q5() {
  sudo chfn -f "" alice &>/dev/null
}

clear_q6() {
  sudo rm -f /home/student/bit/deploy.sh
}

clear_q7() {
  sudo rm -f /home/student/bit/budget.xls
}

clear_q8() {
  sudo rm -f /home/student/bit/report.docx
}

clear_q9() {
  echo "Manual service disable cleanup not implemented."
}

clear_q10() {
  echo "Manual service disable cleanup not implemented."
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
