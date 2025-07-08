#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./clear.sh <question_number|all>"; exit 1; }

echo "Cleaning environment for Question $QNO..."

clear_q1() {
  sudo rm -f /home/student/existingfile.txt
  sudo rm -f /home/student/output.txt
  sudo rm -f /tmp/missingfile.txt
  echo "Files for stdout and stderr redirection removed."
}

clear_q2() {
  sudo rm -f /home/student/logs/logfile.txt
  sudo rmdir --ignore-fail-on-non-empty /home/student/logs
  echo "logfile.txt and logs directory removed."
}

clear_q3() {
  sudo rm -f /home/student/photo_list.txt
  sudo rm -f /home/student/photos/photo1.jpg /home/student/photos/image2.png /home/student/photos/vacation3.jpeg
  sudo rmdir --ignore-fail-on-non-empty /home/student/photos
  echo "Photo directory and listing file removed."
}

clear_q4() {
  sudo usermod -d /home/lucas lucas &>/dev/null || true
  sudo rm -rf /home/projects/lucas
  echo "lucas user directory reset (user not deleted)."
}

clear_q5() {
  sudo userdel -r emily &>/dev/null || true
  echo "User emily deleted."
}

clear_q6() {
  sudo rm -rf /home/student/bit/team_files
  echo "team_files directory removed."
}

clear_q7() {
  sudo rm -f /home/student/bit/todo.txt
  echo "todo.txt file removed."
}

clear_q8() {
  sudo rm -rf /home/student/bit/subdir
  echo "subdir inside /bit removed."
}

clear_q9() {
  sudo systemctl stop apache2 &>/dev/null || true
  sudo systemctl disable apache2 &>/dev/null || true
  echo "Apache2 service stopped and disabled."
}

clear_q10() {
  echo "No cleanup needed for reboot history logs."
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
