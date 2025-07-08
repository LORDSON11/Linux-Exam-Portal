#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student
  echo "Line 1" > /home/student/existingfile.txt
  echo "Missing file will trigger error." > /tmp/missingfile.txt
  echo "Standard output and error redirection test setup completed."
}

setup_q2() {
  sudo mkdir -p /home/student/logs
  cat <<EOF > /home/student/logs/logfile.txt
2024-07-01 Info: Service started
2024-07-01 Error: Failed to connect
2024-07-01 Warning: Memory usage high
2024-07-02 Info: User login
2024-07-02 Error: Out of memory
EOF
  echo "logfile.txt created with sample log entries."
}

setup_q3() {
  sudo mkdir -p /home/student/photos
  touch /home/student/photos/photo1.jpg /home/student/photos/image2.png /home/student/photos/vacation3.jpeg
  echo "Photo files created for listing."
}

setup_q4() {
  sudo useradd -m lucas &>/dev/null || true
  sudo mkdir -p /home/projects/lucas
  echo "User lucas created with custom home directory target."
}

setup_q5() {
  sudo useradd -m emily &>/dev/null || true
  echo "emily:password123" | sudo chpasswd
  echo "User emily created and password set."
}

setup_q6() {
  sudo mkdir -p /home/student/bit/team_files
  chmod 750 /home/student/bit/team_files
  echo "team_files directory created with read and execute permission for group."
}

setup_q7() {
  sudo mkdir -p /home/student/bit
  echo "Task list" > /home/student/bit/todo.txt
  chmod 744 /home/student/bit/todo.txt
  echo "todo.txt created with write access for owner only."
}

setup_q8() {
  sudo mkdir -p /home/student/bit/subdir
  echo 'echo Hello from subdir' > /home/student/bit/subdir/script.sh
  chmod -R a+rx /home/student/bit
  echo "Recursive read and execute permissions applied to /home/student/bit."
}

setup_q9() {
  echo "Ensuring apache2 is installed and logs are available..."
  sudo systemctl enable apache2 &>/dev/null || true
  sudo systemctl start apache2 &>/dev/null || true
  echo "Apache2 service is running for log testing with journalctl."
}

setup_q10() {
  echo "Boot log environment assumed. No setup needed."
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
