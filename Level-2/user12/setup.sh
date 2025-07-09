#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

setup_q1() {
  sudo mkdir -p /home/student/analysis
  echo -e "Info: All good\nError: Disk not found\nWarning: Low memory\nError: Timeout reached" > /home/student/analysis/output.txt
  echo "Q1 setup: Created /home/student/analysis/output.txt with mixed log entries."
}

setup_q2() {
  sudo mkdir -p /home/student/data
  echo -e "Line 1\nLine 2\nLine 3" > /home/student/data/data.txt
  echo "Q2 setup: Created /home/student/data/data.txt"
}

setup_q3() {
  sudo useradd -m laura &>/dev/null || true
  echo "Q3 setup: User laura created."
}

setup_q4() {
  sudo useradd -m olivia &>/dev/null || true
  echo "Q4 setup: User olivia created."
}

setup_q5() {
  sudo useradd -m luke &>/dev/null || true
  echo "Q5 setup: User luke created."
}

setup_q6() {
  sudo mkdir -p /home/student/work
  echo "Project Details" > /home/student/work/project.txt
  chmod 644 /home/student/work/project.txt
  echo "Q6 setup: Created project.txt in /home/student/work with default permissions."
}

setup_q7() {
  sudo mkdir -p /home/student/bit
  echo "Doc 1" > /home/student/bit/doc1.txt
  echo "Doc 2" > /home/student/bit/doc2.txt
  echo "Q7 setup: Created sample files in /home/student/bit."
}

setup_q8() {
  echo "Q8 setup: No setup needed for journalctl output."
}

setup_q9() {
  echo "Q9 setup: No setup needed for systemd-analyze."
}

setup_q10() {
  echo "Q10 setup: No setup needed for service timestamp listing."
}

case "$QNO" in
  1) setup_q1 ;;
  2) setup_q2 ;;
  3) setup_q3 ;;
  4) setup_q4 ;;
  5) setup_q5 ;;
  6) setup_q6 ;;
  7) setup_q7 ;;
  8) setup_q8 ;;
  9) setup_q9 ;;
  10) setup_q10 ;;
  all)
    setup_q1; setup_q2; setup_q3; setup_q4; setup_q5;
    setup_q6; setup_q7; setup_q8; setup_q9; setup_q10 ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

echo "Environment setup complete for Question $QNO."
exit 0
