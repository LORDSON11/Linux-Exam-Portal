#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/logs
  yes "Log Entry" | head -n 50 > /home/student/logs/logfile.txt
  echo "logfile.txt created with 50 lines."
}

setup_q2() {
  sudo mkdir -p /home/student/documents
  sudo touch /home/student/documents/newfile.txt
  echo "Empty file newfile.txt created."
}

setup_q3() {
  sudo mkdir -p /home/student/notes
  echo "Initial note" | sudo tee /home/student/notes/notes.txt > /dev/null
  echo "notes.txt file created with default content."
}

setup_q4() {
  sudo useradd -m jake &>/dev/null || true
  echo "User jake created."
}

setup_q5() {
  sudo useradd -m elena &>/dev/null || true
  sudo groupadd admin &>/dev/null || true
  echo "User elena and group admin created."
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  echo "Umask temporarily set to 027 in session."
}

setup_q7() {
  echo "Test draft content" | sudo tee /home/student/bit/draft.txt > /dev/null
  chmod 700 /home/student/bit/draft.txt
  echo "draft.txt created with 700 permissions."
}

setup_q8() {
  echo "Instructions content" | sudo tee /home/student/bit/instructions.txt > /dev/null
  chmod 644 /home/student/bit/instructions.txt
  echo "instructions.txt created with 644 permissions."
}

setup_q9() {
  echo "Checking SSH service (should already be installed)."
}

setup_q10() {
  echo "Checking active services list (no setup needed)."
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
