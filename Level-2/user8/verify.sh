#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

echo "Verifying environment for Question $QNO..."

verify_q1() {
  if [[ -f /home/student/output.txt ]]; then
    echo "Q1: output.txt exists."
  else
    echo "Q1: output.txt is missing."
  fi
}

verify_q2() {
  if grep -iq "error" /home/student/logs/logfile.txt; then
    echo "Q2: logfile.txt contains 'error' entries."
  else
    echo "Q2: logfile.txt missing or no 'error' found."
  fi
}

verify_q3() {
  if [[ -f /home/student/photo_list.txt ]]; then
    echo "Q3: photo_list.txt exists."
  else
    echo "Q3: photo_list.txt is missing."
  fi
}

verify_q4() {
  home_dir=$(getent passwd lucas | cut -d: -f6)
  if [[ "$home_dir" == "/home/projects/lucas" ]]; then
    echo "Q4: lucas home directory is set correctly."
  else
    echo "Q4: lucas home directory is incorrect or user missing."
  fi
}

verify_q5() {
  id emily &>/dev/null && echo "Q5: User emily exists." || echo "❌ Q5: User emily does not exist."
}

verify_q6() {
  perms=$(stat -c "%A" /home/student/bit/team_files 2>/dev/null)
  if [[ "$perms" == d*r-x* ]]; then
    echo "Q6: team_files directory permissions look correct."
  else
    echo "Q6: team_files permissions incorrect or directory missing."
  fi
}

verify_q7() {
  perms=$(stat -c "%A" /home/student/bit/todo.txt 2>/dev/null)
  if [[ "$perms" =~ ^-rw.* ]]; then
    echo "Q7: todo.txt permissions look correct (owner write only)."
  else
    echo "Q7: todo.txt permissions incorrect or file missing."
  fi
}

verify_q8() {
  perms=$(stat -c "%A" /home/student/bit/test1.sh 2>/dev/null)
  if [[ "$perms" =~ x ]]; then
    echo "Q8: test1.sh has execute permissions."
  else
    echo "Q8: test1.sh missing or not executable."
  fi
}

verify_q9() {
  if sudo systemctl is-active apache2 &>/dev/null; then
    echo "Q9: Apache2 service is active."
  else
    echo "Q9: Apache2 service is inactive."
  fi
}

verify_q10() {
  if journalctl -b -1 &>/dev/null; then
    echo "Q10: Previous boot log accessible."
  else
    echo "Q10: Could not access previous boot log."
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

echo "Verification complete for Question $QNO"
exit 0
