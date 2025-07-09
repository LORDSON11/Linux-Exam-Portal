#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify14.sh <question_number|all>"; exit 1; }

verify_q1() {
  if head -n 1 /home/student/data/data.csv | grep -Fxq "--- Data Log ---"; then
    echo "Q1 passed: Correct line at top"
  else
    echo "Q1 failed: Line not present at top"
  fi
}

verify_q2() {
  if [[ -f /home/student/reports/linecount.txt ]]; then
    if grep -qE '^3$' /home/student/reports/linecount.txt; then
      echo "Q2 passed: linecount.txt shows 3"
    else
      echo "Q2 failed: Incorrect line count"
    fi
  else
    echo "Q2 failed: linecount.txt not found"
  fi
}

verify_q3() {
  if id brian2025 &>/dev/null; then
    echo "Q3 passed: User renamed to brian2025"
  else
    echo "Q3 failed: User not renamed"
  fi
}

verify_q4() {
  if groups frank &>/dev/null; then
    echo "Q4 passed: Groups displayed for frank"
  else
    echo "Q4 failed: Could not get group info for frank"
  fi
}

verify_q5() {
  if sudo chage -l emma | grep -q "2025-06-30"; then
    echo "Q5 passed: Expiry date set for emma"
  else
    echo "Q5 failed: Expiry not set or incorrect"
  fi
}

verify_q6() {
  if [[ "$(stat -c '%a' /home/student/bit/access.key 2>/dev/null)" == "600" ]]; then
    echo "Q6 passed: Permissions set to 600"
  else
    echo "Q6 failed: Incorrect or missing file"
  fi
}

verify_q7() {
  if [[ -f /home/student/share/feedback.txt ]]; then
    perms=$(stat -c "%A" /home/student/share/feedback.txt)
    if echo "$perms" | grep -q "w"; then
      echo "Q7 passed: feedback.txt is writable"
    else
      echo "Q7 failed: feedback.txt is not writable"
    fi
  else
    echo "Q7 failed: feedback.txt does not exist"
  fi
}

verify_q8() {
  if [[ "$(systemctl get-default)" == "rescue.target" ]]; then
    echo "Q8 passed: System is in rescue mode"
  else
    echo "Q8 failed: System is not in rescue mode"
  fi
}

verify_q9() {
  if journalctl -u apache2 &>/dev/null; then
    echo "Q9 passed: Apache logs accessible"
  else
    echo "Q9 info: Apache logs not available or Apache not installed"
  fi
}

verify_q10() {
  if journalctl -b -1 &>/dev/null; then
    echo "Q10 passed: Last boot logs present"
  else
    echo "Q10 failed: No logs from last boot"
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
