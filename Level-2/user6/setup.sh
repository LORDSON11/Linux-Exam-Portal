#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  echo "Creating passwd dummy if not exists (usually exists by default)..."
  sudo touch /etc/passwd
}

setup_q2() {
  sudo useradd -M sara &>/dev/null || true
  echo "User sara ensured for group query."
}

setup_q3() {
  sudo mkdir -p /home/student/logs
  echo "Initial log content" | sudo tee /home/student/logs/log.txt >/dev/null
}

setup_q4() {
  sudo mkdir -p /home/student/data
  yes "Sample data line" | head -n 20 | sudo tee /home/student/data/data.txt > /dev/null
}

setup_q5() {
  sudo rm -f /home/student/errors.txt
  echo "(You will trigger an error manually for testing redirection.)"
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  sudo touch /home/student/bit/file1.txt /home/student/bit/file2.txt
  chmod 640 /home/student/bit/file1.txt
}

setup_q7() {
  umask
  sudo mkdir -p /home/student/bit
  sudo touch /home/student/bit/test_umask.txt
}

setup_q8() {
  sudo mkdir -p /home/student/bit
  echo -e "#!/bin/bash\necho Hello" | sudo tee /home/student/bit/runme.sh >/dev/null
  chmod 644 /home/student/bit/runme.sh
}

setup_q9() {
  sudo systemctl stop telnet 2>/dev/null || true
  sudo systemctl mask telnet 2>/dev/null || true
  echo "Telnet service masked."
}

setup_q10() {
  sudo systemctl unmask telnet 2>/dev/null || true
  echo "Telnet service unmasked."
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
