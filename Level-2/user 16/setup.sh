#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/memos
  sudo rm -f /home/student/memos/reminder.txt
  echo "[Q1] Setup: Directory created."
}

setup_q2() {
  sudo mkdir -p /home/student/library
  yes "This is an ebook line." | head -n 100 > /home/student/library/ebook.txt
  echo "[Q2] Setup: ebook.txt with 100 lines created."
}

setup_q3() {
  sudo groupadd developers 2>/dev/null
  sudo useradd -m roger 2>/dev/null
  echo "[Q3] Setup: User roger and group developers created."
}

setup_q4() {
  echo "[Q4] No setup needed."
}

setup_q5() {
  sudo useradd -m alex 2>/dev/null
  echo "[Q5] Setup: User alex created."
}

setup_q6() {
  sudo useradd -m lucy 2>/dev/null
  sudo chsh -s /bin/bash lucy
  echo "[Q6] Setup: User lucy created."
}

setup_q7() {
  sudo mkdir -p /home/student/bit
  echo "File permission check" | sudo tee /home/student/bit/file.txt > /dev/null
  sudo chmod 644 /home/student/bit/file.txt
  echo "[Q7] Setup: file.txt with 644 permission created."
}

setup_q8() {
  sudo mkdir -p /home/student/bit
  sudo touch /home/student/bit/openfile
  sudo chmod 777 /home/student/bit/openfile
  echo "[Q8] Setup: openfile with 777 permissions created."
}

setup_q9() {
  echo "[Q9] No actual setup needed – journald should be available."
}

setup_q10() {
  echo "[Q10] No setup – nginx must be manually installed if not present."
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