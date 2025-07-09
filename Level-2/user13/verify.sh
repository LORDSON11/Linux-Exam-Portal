#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

verify_q1() {
  if [[ -f /home/student/logs/session.log ]] && grep -Fxq "Session Started" /home/student/logs/session.log; then
    echo "Q1 verification passed: session.log exists and contains 'Session Started'."
  else
    echo "Q1 verification failed: session.log missing or incorrect content."
  fi
}

verify_q2() {
  if [[ -f /home/student/projects/readme.txt ]] && head -n 1 /home/student/projects/readme.txt | grep -Fxq "Project Instructions Below"; then
    echo "Q2 verification passed: First line is 'Project Instructions Below'."
  else
    echo "Q2 verification failed: readme.txt missing or incorrect content."
  fi
}

verify_q3() {
  if sudo passwd -S olga 2>/dev/null | grep -q 'L'; then
    echo "Q3 verification passed: User olga account is locked."
  else
    echo "Q3 verification failed: User olga account is not locked."
  fi
}

verify_q4() {
  if cut -d: -f1 /etc/passwd | grep -q .; then
    echo "Q4 verification passed: User accounts listed."
  else
    echo "Q4 verification failed: Could not list users."
  fi
}

verify_q5() {
  if groups henry &>/dev/null; then
    echo "Q5 verification passed: Group info for henry found."
  else
    echo "Q5 verification failed: No group info for henry."
  fi
}

verify_q6() {
  if stat -c "%A" /home/student/bit | grep -q 't'; then
    echo "Q6 verification passed: Sticky bit is set on /home/student/bit."
  else
    echo "Q6 verification failed: Sticky bit is not set."
  fi
}

verify_q7() {
  if stat -c "%A" /home/student/bit | grep -q 's'; then
    echo "Q7 verification passed: SGID is set on /home/student/bit."
  else
    echo "Q7 verification failed: SGID is not set."
  fi
}

verify_q8() {
  if systemctl list-units --type=target --no-pager | grep -q target; then
    echo "Q8 verification passed: Systemd targets listed."
  else
    echo "Q8 verification failed: Could not list systemd targets."
  fi
}

verify_q9() {
  if systemctl get-default | grep -q "multi-user.target"; then
    echo "Q9 verification passed: Default target is multi-user.target."
  else
    echo "Q9 verification failed: Default target is not multi-user.target."
  fi
}

verify_q10() {
  if systemctl get-default | grep -q "graphical.target"; then
    echo "Q10 verification passed: Default target is graphical.target."
  else
    echo "Q10 verification failed: Default target is not graphical.target."
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
