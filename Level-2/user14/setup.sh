#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup14.sh <question_number|all>"; exit 1; }

setup_q1() {
  mkdir -p /home/student/data
  echo "Existing CSV data" > /home/student/data/data.csv
  echo "Q1: Created data.csv"
}

setup_q2() {
  mkdir -p /home/student/reports
  echo -e "Report line 1\nReport line 2\nSummary here" > /home/student/reports/summary.txt
  echo "Q2: Created summary.txt with 3 lines"
}

setup_q3() {
  sudo id brian &>/dev/null || sudo useradd brian
  echo "Q3: User brian ensured"
}

setup_q4() {
  sudo id frank &>/dev/null || sudo useradd frank
  sudo groupadd testgrp 2>/dev/null
  sudo usermod -aG testgrp frank
  echo "Q4: User frank ensured and added to testgrp"
}

setup_q5() {
  sudo id emma &>/dev/null || sudo useradd emma
  echo "Q5: User emma ensured"
}

setup_q6() {
  mkdir -p /home/student/bit
  echo "secret key" > /home/student/bit/access.key
  chmod 600 /home/student/bit/access.key
  echo "Q6: access.key created and permission set"
}

setup_q7() {
  mkdir -p /home/student/share
  echo "feedback entry" > /home/student/share/feedback.txt
  chmod 664 /home/student/share/feedback.txt
  echo "Q7: feedback.txt created and permissions modified"
}

setup_q8() {
  echo "Q8: No setup needed (rescue mode is a runtime switch)"
}

setup_q9() {
  echo "Q9: No setup needed (journalctl command-based)"
}

setup_q10() {
  echo "Q10: No setup needed (boot log inspection only)"
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