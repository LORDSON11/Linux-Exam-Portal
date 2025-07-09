#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/logs
  echo "System check completed successfully." > /home/student/logs/system_check.txt
  echo "Q1 setup complete."
}

setup_q2() {
  sudo mkdir -p /home/student/docs
  for i in {1..20}; do echo "Instruction line $i" >> /home/student/docs/instructions.txt; done
  echo "Q2 setup complete."
}

setup_q3() {
  sudo mkdir -p /home/student/notes
  echo "Initial note." > /home/student/notes/history.txt
  echo "Q3 setup complete."
}

setup_q4() {
  sudo touch /home/student/data.txt
  sudo chgrp root /home/student/data.txt
  echo "Q4 setup complete."
}

setup_q5() {
  echo "Creating users with UID and GID sample data."
  echo "Q5 setup complete."
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  echo "Top Secret Data" > /home/student/bit/secret.txt
  chmod 600 /home/student/bit/secret.txt
  echo "Q6 setup complete."
}

setup_q7() {
  echo "Report content" > /home/student/bit/report.txt
  chmod 444 /home/student/bit/report.txt
  echo "Q7 setup complete."
}

setup_q8() {
  echo "db config" > /home/student/bit/db.conf
  sudo chown student:student /home/student/bit/db.conf
  echo "Q8 setup complete."
}

setup_q9() {
  logger -p err "Critical error occurred!"
  logger -p crit "System crashed briefly"
  echo "Q9 setup complete."
}

setup_q10() {
  echo "dmesg command will pull kernel logs." > /dev/null
  echo "Q10 setup complete."
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
