#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/summary
  echo "This is Part A" | sudo tee /home/student/summary/partA.txt > /dev/null
  echo "This is Part B" | sudo tee /home/student/summary/partB.txt > /dev/null
  echo "[Q1] partA.txt and partB.txt created."
}

setup_q2() {
  sudo mkdir -p /home/student/logs
  yes "Sample log line" | head -n 50 > /home/student/logs/events.log
  echo "[Q2] events.log with 50 lines created."
}

setup_q3() {
  sudo useradd -M tempuser 2>/dev/null
  echo "Mail for tempuser" | sudo tee /var/spool/mail/tempuser > /dev/null
  echo "[Q3] Mail spool file for tempuser created."
}

setup_q4() {
  sudo useradd -s /usr/sbin/nologin nash 2>/dev/null
  echo "[Q4] User nash with no login shell created."
}

setup_q5() {
  sudo useradd -m bob 2>/dev/null
  echo "bob's file" | sudo tee /home/bob/data.txt > /dev/null
  echo "[Q5] User bob with file created in home."
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  echo -e "#!/bin/bash\necho Shutdown" | sudo tee /home/student/bit/shutdown.sh > /dev/null
  sudo chmod +x /home/student/bit/shutdown.sh
  echo "[Q6] shutdown.sh created with execute permission."
}

setup_q7() {
  echo "Collaboration file" | sudo tee /home/student/bit/collab.txt > /dev/null
  sudo chmod 644 /home/student/bit/collab.txt
  echo "[Q7] collab.txt created with default permissions."
}

setup_q8() {
  echo "[Q8] No setup needed – assuming bluetooth service is installed."
}

setup_q9() {
  echo "[Q9] No setup needed – assuming vsftpd service is installed."
}

setup_q10() {
  echo "[Q10] No setup needed – assuming vsftpd service is installed."
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
    setup_q1; setup_q2; setup_q3; setup_q4; setup_q5
    setup_q6; setup_q7; setup_q8; setup_q9; setup_q10 ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

echo " Setup complete for Question $QNO."
exit 0
