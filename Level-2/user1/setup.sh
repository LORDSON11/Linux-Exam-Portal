#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/notices
  yes "Semester announcement." | head -n 20 > /home/student/notices/announcement.txt
  echo "[Q1] Created announcement.txt with 20 lines in /home/student/notices."
}

setup_q2() {
  sudo mkdir -p /home/student/reports
  sudo touch /home/student/reports/report.txt
  echo "[Q2] report.txt created in /home/student/reports."
}

setup_q3() {
  sudo mkdir -p /home/student/docs
  touch /home/student/docs/sample1.txt /home/student/docs/sample2.txt
  echo "[Q3] Created sample files in /home/student/docs."
}

setup_q4() {
  sudo useradd -m john 2>/dev/null || true
  echo "[Q4] User john created."
}

setup_q5() {
  sudo useradd -m mike 2>/dev/null || true
  echo "[Q5] User mike created and ready to be deleted."
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  echo -e "#!/bin/bash\necho 'Cleaning up...'" | sudo tee /home/student/bit/cleanup.sh > /dev/null
  sudo chmod 644 /home/student/bit/cleanup.sh
  echo "[Q6] cleanup.sh created with restricted permissions (not executable yet)."
}

setup_q7() {
  echo "My private notes" | sudo tee /home/student/bit/personal_notes.txt > /dev/null
  sudo chmod 644 /home/student/bit/personal_notes.txt
  echo "[Q7] personal_notes.txt created with 644 permissions."
}

setup_q8() {
  echo "Company policy content" | sudo tee /home/student/bit/policy.pdf > /dev/null
  sudo chmod 666 /home/student/bit/policy.pdf
  echo "[Q8] policy.pdf created with full write access (to be restricted)."
}

setup_q9() {
  sudo apt update -y
  sudo apt install -y apache2
  sudo systemctl enable apache2
  sudo systemctl start apache2
  echo "[Q9] Apache installed and started."
}

setup_q10() {
  sudo apt install -y openssh-server
  sudo systemctl stop ssh
  echo "[Q10] SSH service stopped to test start action."
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

echo "✅ Setup complete for Question $QNO."
exit 0
