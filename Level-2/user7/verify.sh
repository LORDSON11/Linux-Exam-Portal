#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

echo "Verifying setup for Question $QNO..."

verify_q1() {
  if [ -f /home/student/output.txt ]; then
    echo "Q1: output.txt exists."
  else
    echo "Q1: output.txt is missing."
  fi
}

verify_q2() {
  if grep -iq "error" /home/student/logs/logfile.txt; then
    echo "Q2: logfile.txt contains 'error'."
  else
    echo "Q2: logfile.txt does not contain 'error'."
  fi
}

verify_q3() {
  if [ -f /home/student/photo_list.txt ]; then
    echo "Q3: photo_list.txt was created."
  else
    echo "Q3: photo_list.txt is missing."
  fi
}

verify_q4() {
  if [ "$(getent passwd lucas)" ]; then
    echo "Q4: User lucas exists."
  else
    echo "Q4: User lucas not found."
  fi
}

verify_q5() {
  sudo passwd -S emily 2>/dev/null | grep -q "emily"
  if [ $? -eq 0 ]; then
    echo "Q5: User emily's password is set."
  else
    echo "Q5: Unable to verify emily's password."
  fi
}

verify_q6() {
  perms=$(stat -c "%A" /home/student/bit/team_files)
  if [[ "$perms" == d*r-xr-x--- || "$perms" == d*rwxr-x--- ]]; then
    echo "Q6: team_files permissions set correctly."
  else
    echo "Q6: Incorrect permissions for team_files."
  fi
}

verify_q7() {
  perms=$(stat -c "%A" /home/student/bit/todo.txt)
  if [[ "$perms" == "-rw-r--r--" || "$perms" == "-rw-------" ]]; then
    echo "Q7: todo.txt permissions are correctly restricted."
  else
    echo "Q7: todo.txt permissions are not set correctly."
  fi
}

verify_q8() {
  fail=false
  while IFS= read -r -d '' file; do
    perms=$(stat -c "%A" "$file")
    if [[ "$perms" != *r*x* ]]; then
      echo "Q8: $file missing read/execute."
      fail=true
    fi
  done < <(find /home/student/bit -type f -print0)

  if [ "$fail" = false ]; then
    echo "Q8: All files and subdirectories have rx permissions."
  fi
}

verify_q9() {
  sudo journalctl -u apache2 --since "5 minutes ago" | grep -q .
  if [ $? -eq 0 ]; then
    echo "Q9: Apache logs found in journalctl."
  else
    echo "Q9: No Apache logs found recently."
  fi
}

verify_q10() {
  if journalctl -b -1 | grep -q .; then
    echo "Q10: Previous boot logs found."
  else
    echo "Q10: No previous boot logs found or system only has one boot."
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
