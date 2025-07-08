#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

install_package() {
  if ! command -v "$1" &>/dev/null; then
    echo "Installing package: $1"
    sudo apt-get update -qq
    sudo apt-get install -y "$1"
  else
    echo "Package $1 already installed."
  fi
}

setup_q1() {
  sudo mkdir -p /home/student/docs
  yes "Instruction line" | head -n 100 > /home/student/docs/instructions.txt
  echo "instructions.txt created with 100 lines."
  install_package vim
}

setup_q2() {
  sudo mkdir -p /home/student/configs
  echo "parameter=value" > /home/student/configs/config.txt
  echo "config.txt created with sample config."
  install_package vim
}

setup_q3() {
  sudo mkdir -p /home/student/docs
  touch /home/student/docs/fileA.txt /home/student/docs/fileB.txt /home/student/docs/fileC.txt
  echo "3 sample files created in /home/student/docs."
}

setup_q4() {
  sudo useradd -M steve || true
  sudo groupadd devs || true
  sudo usermod -aG devs steve
  echo "User steve added to devs group."
}

setup_q5() {
  sudo useradd -m harry || true
  echo "User harry created."
  install_package passwd
  install_package chage
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  echo "Group writable file" > /home/student/bit/team.txt
  chmod 640 /home/student/bit/team.txt
  echo "team.txt created with restricted permissions."
}

setup_q7() {
  echo "This file should not be executable" > /home/student/bit/notes.txt
  chmod a+x /home/student/bit/notes.txt
  echo "notes.txt created with execute permission (to be removed)."
}

setup_q8() {
  sudo mkdir -p /home/student/bit/public.html
  chmod 777 /home/student/bit/public.html
  echo "public.html directory created with open permissions (to be changed)."
}

setup_q9() {
  echo "No setup required. This only checks failed services."
}

setup_q10() {
  echo "Installing PostgreSQL if not installed..."
  install_package postgresql
  sudo systemctl enable postgresql
  echo "PostgreSQL installed and enabled to start on boot."
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
