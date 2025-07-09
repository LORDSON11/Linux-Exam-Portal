#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup14.sh <question_number|all>"; exit 1; }

setup_q1() {
  mkdir -p /home/student/data
  echo -e "Row1,Value1\nRow2,Value2" > /home/student/data/data.csv
  echo "Q1 setup: data.csv created in /home/student/data"
}

setup_q2() {
  mkdir -p /home/student/reports
  echo -e "Summary line 1\nSummary line 2\nSummary line 3" > /home/student/reports/summary.txt
  echo "Q2 setup: summary.txt created in /home/student/reports"
}

setup_q3() {
  if ! id brian &>/dev/null && ! id brian2025 &>/dev/null; then
    sudo useradd brian
    echo "Q3 setup: User 'brian' created"
  else
    echo "Q3 setup: User already exists"
  fi
}

setup_q4() {
  sudo groupadd testgrp &>/dev/null || true
  if ! id frank &>/dev/null; then
    sudo useradd -G testgrp frank
    echo "Q4 setup: User 'frank' added to 'testgrp'"
  else
    echo "Q4 setup: User 'frank' already exists"
  fi
}

setup_q5() {
  if ! id emma &>/dev/null; then
    sudo useradd emma
    sudo chage -E 2025-06-30 emma
    echo "Q5 setup: User 'emma' created with expiry date"
  else
    echo "Q5 setup: User 'emma' already exists"
  fi
}

setup_q6() {
  mkdir -p /home/student/bit
  touch /home/student/bit/access.key
  chmod 600 /home/student/bit/access.key
  echo "Q6 setup: access.key file created with 600 permissions"
}

setup_q7() {
  mkdir -p /home/student/share
  echo "Feedback here" > /home/student/share/feedback.txt
  chmod go+w /home/student/share/feedback.txt
  echo "Q7 setup: feedback.txt created with write access to group and others"
}

setup_q8() {
  sudo systemctl set-default rescue.target
  echo "Q8 setup: System default target set to rescue mode"
}

setup_q9() {
  echo "Q9 setup: No setup action required. Apache logs assumed to be present if installed"
}

setup_q10() {
  echo "Q10 setup: No setup action required. This will depend on previous boot logs"
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

echo "Setup complete for Question $QNO"
exit 0
