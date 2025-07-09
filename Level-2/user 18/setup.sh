#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  yes "Report line" | head -n 120 > report.txt
  echo "[Q1] report.txt with 120 lines created."
}

setup_q2() {
  yes "Log line" | head -n 200 > log.txt
  echo "[Q2] log.txt with 200 lines created."
}

setup_q3() {
  sudo useradd -m charlie 2>/dev/null
  sudo chage -M 99999 charlie
  echo "[Q3] User charlie created."
}

setup_q4() {
  echo "[Q4] No setup needed."
}

setup_q5() {
  sudo useradd -c "Jill Cooper" jill 2>/dev/null
  echo "[Q5] User jill with GECOS name created."
}

setup_q6() {
  sudo mkdir -p /home/student/logs
  sudo touch /home/student/logs/file.log
  sudo chmod 600 /home/student/logs/file.log
  echo "[Q6] file.log created in logs directory."
}

setup_q7() {
  touch data.db
  chmod 777 data.db
  echo "[Q7] data.db with custom permissions created."
}

setup_q8() {
  sudo apt install -y nginx &>/dev/null
  sudo systemctl stop nginx
  echo "[Q8] nginx installed and stopped."
}

setup_q9() {
  echo "[Q9] Assuming nginx is installed. No config edit needed."
}

setup_q10() {
  echo "[Q10] No setup needed."
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

echo "Setup complete for Question $QNO."
exit 0
