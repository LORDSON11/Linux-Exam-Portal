#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning environment for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/logs/logfile.txt
  echo "logfile.txt removed."
}

clear_q2() {
  sudo rm -f /home/student/documents/newfile.txt
  echo "newfile.txt removed."
}

clear_q3() {
  sudo rm -f /home/student/notes/notes.txt
  echo "notes.txt removed."
}

clear_q4() {
  sudo userdel -r jake &>/dev/null
  echo "User jake deleted."
}

clear_q5() {
  sudo userdel -r elena &>/dev/null
  sudo groupdel admin &>/dev/null
  echo "User elena and group admin removed."
}

clear_q6() {
  echo "No permanent change made. Umask reset not needed."
}

clear_q7() {
  sudo rm -f /home/student/bit/draft.txt
  echo "draft.txt removed."
}

clear_q8() {
  sudo rm -f /home/student/bit/instructions.txt
  echo "instructions.txt removed."
}

clear_q9() {
  echo "No cleanup needed for SSH service check."
}

clear_q10() {
  echo "No cleanup needed for active services listing."
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
