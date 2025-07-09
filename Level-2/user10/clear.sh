#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning environment for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/temp/quick.txt
}

clear_q2() {
  sudo rm -f /home/student/assignments/full_assignment.txt
}

clear_q3() {
  sudo sed -i '/--- Final Record ---/d' /home/student/data/record.txt
}

clear_q4() {
  echo "(No changes required for last login info.)"
}

clear_q5() {
  echo "(No changes required for grep home directory lookup.)"
}

clear_q6() {
  sudo chgrp root /home/student/bit/designs 2>/dev/null
}

clear_q7() {
  sudo sed -i '/umask 002/d' /home/student/bit/myscript.sh
}

clear_q8() {
  sudo rm -f /home/student/bit/monitor.sh
}

clear_q9() {
  echo "Manual systemd service configuration not reverted automatically."
}

clear_q10() {
  echo "(No cleanup necessary for viewing system power events.)"
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

echo "Cleanup completed for Question $QNO"
exit 0
