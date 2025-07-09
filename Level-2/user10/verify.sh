#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

echo "Verifying Question $QNO..."

verify_q1() {
  FILE="/home/student/temp/quick.txt"
  if [[ -f "$FILE" ]] && [[ ! -s "$FILE" ]]; then
    echo "Q1: File exists and is empty."
  else
    echo "Q1: File missing or not empty."
  fi
}

verify_q2() {
  TARGET="/home/student/assignments/full_assignment.txt"
  if [[ -f "$TARGET" ]] && grep -q "Intro Content" "$TARGET" && grep -q "Conclusion Content" "$TARGET"; then
    echo "Q2: File combined correctly."
  else
    echo "Q2: Combined file missing or incorrect content."
  fi
}

verify_q3() {
  FILE="/home/student/data/record.txt"
  if [[ -f "$FILE" ]] && grep -q "^--- Final Record ---" "$FILE"; then
    echo "Q3: Line added correctly at the top."
  else
    echo "Q3: Line not found at the top of the file."
  fi
}

verify_q4() {
  if lastlog -u nancy | grep -q "nancy"; then
    echo "Q4: Last login info retrieved."
  else
    echo "Q4: No login info found for user nancy."
  fi
}

verify_q5() {
  HOME_DIR=$(grep ^victor /etc/passwd | cut -d: -f6)
  if [[ "$HOME_DIR" == "/home/admin/accounts/victor" ]]; then
    echo "Q5: Correct home directory for victor."
  else
    echo "Q5: Incorrect or missing home directory."
  fi
}

verify_q6() {
  DIR="/home/student/bit/designs"
  if [[ -d "$DIR" ]] && [[ "$(stat -c %G $DIR)" == "designers" ]]; then
    echo "Q6: Group ownership is correct."
  else
    echo "Q6: Group ownership incorrect."
  fi
}

verify_q7() {
  FILE="/home/student/bit/myscript.sh"
  if [[ -f "$FILE" ]] && grep -q "^umask 002" "$FILE"; then
    echo "Q7: umask set correctly in script."
  else
    echo "Q7: umask not found in script."
  fi
}

verify_q8() {
  FILE="/home/student/bit/monitor.sh"
  if [[ -f "$FILE" ]] && [[ -x "$FILE" ]]; then
    echo "Q8: File created with execute permission."
  else
    echo "Q8: File missing or not executable."
  fi
}

verify_q9() {
  CONFIG="/etc/systemd/system/nginx.service.d/override.conf"
  if [[ -f "$CONFIG" ]] && grep -q "Restart=always" "$CONFIG"; then
    echo "Q9: Restart policy set correctly."
  else
    echo "Q9: Restart policy not configured."
  fi
}

verify_q10() {
  journalctl | grep -Ei "shutdown|reboot" &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "Q10: Shutdown and reboot logs found."
  else
    echo "Q10: No shutdown/reboot logs found."
  fi
}

case "$QNO" in
  1) verify_q1 ;;
  2) verify_q2 ;;
  3) verify_q3 ;;
  4) verify_q4 ;;
  5) verify_q5 ;;
  6) verify_q6 ;;
  7) verify_q7 ;;
  8) verify_q8 ;;
  9) verify_q9 ;;
  10) verify_q10 ;;
  all)
    verify_q1; verify_q2; verify_q3; verify_q4; verify_q5;
    verify_q6; verify_q7; verify_q8; verify_q9; verify_q10 ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

exit 0
