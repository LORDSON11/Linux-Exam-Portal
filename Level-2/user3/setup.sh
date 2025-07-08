#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/data
  yes "Line in largefile.txt" | head -n 100 > /home/student/data/largefile.txt
  echo "[Q1] largefile.txt created with 100 lines in /home/student/data"
}

setup_q2() {
  sudo mkdir -p /home/student/docs
  yes "Line in summary.txt" | head -n 80 > /home/student/docs/summary.txt
  echo "[Q2] summary.txt created with 80 lines in /home/student/docs"
}

setup_q3() {
  sudo mkdir -p /home/student/reports
  yes "Line in report.txt" | head -n 20 > /home/student/reports/report.txt
  echo "[Q3] report.txt created with 20 lines in /home/student/reports"
}

setup_q4() {
  sudo useradd -m bob &>/dev/null || true
  echo "[Q4] User bob created"
}

setup_q5() {
  sudo useradd -m susan &>/dev/null || true
  sudo passwd -l susan 2>/dev/null
  echo "[Q5] User susan created and locked"
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  echo "sample config data" | sudo tee /home/student/bit/config.ini >/dev/null
  sudo useradd -m admin &>/dev/null || true
  sudo groupadd admins &>/dev/null || true
  echo "[Q6] config.ini created and user admin/group admins ready"
}

setup_q7() {
  sudo mkdir -p /home/student/bit/team
  sudo groupadd projectx &>/dev/null || true
  echo "[Q7] Directory /home/student/bit/team created"
}

setup_q8() {
  echo "summary file permissions check" | sudo tee /home/student/bit/summary.txt >/dev/null
  echo "[Q8] summary.txt created in /home/student/bit"
}

setup_q9() {
  echo "[Q9] Installing nginx..."
  sudo apt update -y
  sudo apt install -y nginx
  sudo systemctl enable nginx
  sudo systemctl start nginx
  echo "[Q9] nginx installed and started"
}

setup_q10() {
  echo "[Q10] Installing apache2..."
  sudo apt update -y
  sudo apt install -y apache2
  sudo systemctl enable apache2
  sudo systemctl start apache2
  echo "[Q10] apache2 installed and started"
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

echo "✅ Setup complete for Question $QNO"
exit 0
