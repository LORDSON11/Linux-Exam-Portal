#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  echo "Original content of memo." > memo.txt
  echo "[Q1] memo.txt created."
}

setup_q2() {
  mkdir -p /nonexistent_dir 2>/dev/null
  echo "[Q2] Partial valid/invalid dirs simulated."
}

setup_q3() {
  sudo useradd zack 2>/dev/null || true
  echo "[Q3] User zack ensured."
}

setup_q4() {
  sudo useradd -m steve 2>/dev/null || true
  echo "ls -l" > /home/steve/.bash_history
  sudo chown steve:steve /home/steve/.bash_history
  echo "[Q4] User steve's .bash_history prepared."
}

setup_q5() {
  sudo useradd sarah 2>/dev/null || true
  echo "[Q5] User sarah ensured."
}

setup_q6() {
  mkdir -p /home/student/bit
  echo "Sensitive Data" > /home/student/bit/credentials.txt
  chmod 600 /home/student/bit/credentials.txt
  echo "[Q6] credentials.txt created."
}

setup_q7() {
  mkdir -p /home/student/bit/shared
  chmod 770 /home/student/bit/shared
  echo "[Q7] shared directory created."
}

setup_q8() {
  sudo apt install -y nginx &>/dev/null
  sudo systemctl start nginx
  echo "[Q8] nginx installed and started."
}

setup_q9() {
  echo "[Q9] Boot logs will be checked directly using journalctl."
}

setup_q10() {
  echo "[Q10] nginx logs assumed available from running service."
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

echo " Setup complete for Question $QNO."
exit 0
