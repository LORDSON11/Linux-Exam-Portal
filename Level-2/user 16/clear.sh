#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning up environment for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/memos/reminder.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/memos
}

clear_q2() {
  sudo rm -f /home/student/library/ebook.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/library
}

clear_q3() {
  sudo userdel -r roger &>/dev/null
  sudo groupdel developers &>/dev/null
}

clear_q4() {
  echo "[Q4] No cleanup required."
}

clear_q5() {
  sudo userdel -r alex &>/dev/null
}

clear_q6() {
  sudo userdel -r lucy &>/dev/null
}

clear_q7() {
  sudo rm -f /home/student/bit/file.txt
}

clear_q8() {
  sudo rm -f /home/student/bit/openfile
}

clear_q9() {
  echo "[Q9] No cleanup required."
}

clear_q10() {
  echo "[Q10] No cleanup required."
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

echo "🧹 Cleanup complete for Question $QNO."
exit 0