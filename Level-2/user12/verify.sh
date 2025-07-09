#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

verify_q1() {
  if grep -q "Error" /home/student/analysis/output.txt; then
    echo "Q1 verification passed: 'Error' lines found."
  else
    echo "Q1 verification failed: No 'Error' lines found."
  fi
}

verify_q2() {
  if [[ -f /home/student/data/data_copy.txt ]]; then
    echo "Q2 verification passed: data_copy.txt exists."
  else
    echo "Q2 verification failed: data_copy.txt missing."
  fi
}

verify_q3() {
  if sudo grep -q '^laura:' /etc/shadow 2>/dev/null; then
    echo "Q3 verification passed: User laura exists."
  else
    echo "Q3 verification failed: User laura not found."
  fi
}

verify_q4() {
  admin_group=$(id -nG olivia 2>/dev/null | grep -wo "admin")
  dev_group=$(id -nG olivia 2>/dev/null | grep -wo "dev")
  if [[ -n "$admin_group" && -n "$dev_group" ]]; then
    echo "Q4 verification passed: olivia in admin and dev groups."
  else
    echo "Q4 verification failed: olivia not in both groups."
  fi
}

verify_q5() {
  if id luke &>/dev/null; then
    echo "Q5 verification passed: User luke exists."
  else
    echo "Q5 verification failed: User luke not found."
  fi
}

verify_q6() {
  perms=$(stat -c "%a" /home/student/work/project.txt 2>/dev/null)
  if [[ "$perms" == "640" ]]; then
    echo "Q6 verification passed: Permissions set to 640."
  else
    echo "Q6 verification failed: Incorrect permissions $perms."
  fi
}

verify_q7() {
  issues=0
  for file in /home/student/bit/*; do
    [[ -r "$file" ]] || { echo "Q7 failed: $file is not readable"; ((issues++)); }
  done
  [[ $issues -eq 0 ]] && echo "Q7 verification passed: All files are readable."
}

verify_q8() {
  if journalctl -o verbose 2>/dev/null | grep -q '_EXE='; then
    echo "Q8 verification passed: '_EXE' field present in journalctl output."
  else
    echo "Q8 verification failed: '_EXE' field not found in journalctl output."
  fi
}

verify_q9() {
  if systemd-analyze critical-chain &>/dev/null; then
    echo "Q9 verification passed: critical-chain command executed successfully."
  else
    echo "Q9 verification failed: critical-chain command failed."
  fi
}

verify_q10() {
  if systemctl list-units --type=service --all --no-pager &>/dev/null; then
    echo "Q10 verification passed: systemctl service list retrieved successfully."
  else
    echo "Q10 verification failed: systemctl command failed."
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