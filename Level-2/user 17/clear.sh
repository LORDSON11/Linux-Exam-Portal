#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning up environment for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/summary/partA.txt /home/student/summary/partB.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/summary
}

clear_q2() {
  sudo rm -f /home/student/logs/events.log /home/student/logs/mid_lines.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/logs
}

clear_q3() {
  sudo rm -f /var/spool/mail/tempuser
  sudo userdel tempuser &>/dev/null
}

clear_q4() {
  sudo userdel -r nash &>/dev/null
}

clear_q5() {
  sudo userdel -r bob &>/dev/null
  sudo rm -rf /home/old_bob
}

clear_q6() {
  sudo rm -f /home/student/bit/shutdown.sh
}

clear_q7() {
  sudo rm -f /home/student/bit/collab.txt
}

clear_q8() {
  sudo systemctl enable bluetooth &>/dev/null
}

clear_q9() {
  sudo systemctl unmask vsftpd &>/dev/null
}

clear_q10() {
  echo "[Q10] Nothing to clean."
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

echo "Cleanup complete for Question $QNO."
exit 0
