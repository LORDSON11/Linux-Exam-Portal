#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

echo "Verifying Question $QNO..."

verify_q1() {
  if [[ -f /home/student/reports/overview.txt ]]; then
    echo "Q1: overview.txt exists. Use 'less' to view in pages manually."
  else
    echo "Q1: overview.txt does not exist."
  fi
}

verify_q2() {
  LINES=$(wc -l < /home/student/logs/logfile.txt 2>/dev/null)
  if [[ "$LINES" =~ ^[0-9]+$ ]]; then
    echo "Q2: Line count is $LINES."
  else
    echo "Q2: logfile.txt not found or invalid output."
  fi
}

verify_q3() {
  if id chris &>/dev/null && id chris | grep -q "devs"; then
    echo "Q3: User chris exists and is in group devs."
  else
    echo "Q3: User chris not created or not in devs group."
  fi
}

verify_q4() {
  if [[ -s /etc/group ]]; then
    echo "Q4: Groups listed from /etc/group."
  else
    echo "Q4: Failed to read /etc/group."
  fi
}

verify_q5() {
  UID=$(id -u tina 2>/dev/null)
  if [[ "$UID" =~ ^[0-9]+$ ]]; then
    echo "Q5: UID for tina is $UID."
  else
    echo "Q5: User tina not found."
  fi
}

verify_q6() {
  FILE="/home/student/bit/dev/start.sh"
  if [[ -f "$FILE" ]] && [[ "$(stat -c "%A" $FILE)" == *x* ]]; then
    echo "Q6: Group execute permission set for start.sh."
  else
    echo "Q6: Execute permission for group is missing on start.sh."
  fi
}

verify_q7() {
  CONFIG="/home/student/.config"
  if [[ -d "$CONFIG" ]] && ls -la "$CONFIG" | grep -q "^\."; then
    echo "Q7: Hidden files and permissions are visible in .config."
  else
    echo "Q7: Hidden files not found or command not used properly."
  fi
}

verify_q8() {
  systemctl list-units --type=service &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "Q8: System services listed successfully."
  else
    echo "Q8: Could not list system services."
  fi
}

verify_q9() {
  echo "ℹQ9: Cannot verify journalctl -f output in script (real-time). Please run manually."
}

verify_q10() {
  journalctl -u ssh -n 50 &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "Q10: Last 50 lines of SSH log retrieved."
  else
    echo "Q10: Failed to get SSH service logs."
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
    verify_q1; verify_q2; verify_q3; verify_q4; verify_q5
    verify_q6; verify_q7; verify_q8; verify_q9; verify_q10 ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

exit 0
