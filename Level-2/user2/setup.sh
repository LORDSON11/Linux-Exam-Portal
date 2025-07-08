#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/data
  yes "Line in longfile.txt" | head -n 100 > /home/student/data/longfile.txt
  echo "[Q1] longfile.txt created with 100 lines in /home/student/data"
}

setup_q2() {
  sudo mkdir -p /home/student
  yes "80" | head -n 25 > /home/student/marks.txt
  echo "[Q2] marks.txt created with 25 lines in /home/student"
}

setup_q3() {
  echo "System info and configuration details." | sudo tee /home/student/info.txt > /dev/null
  echo "[Q3] info.txt created in /home/student"
}

setup_q4() {
  sudo useradd -m -d /home/anna anna 2>/dev/null || true
  echo "[Q4] User anna created with home directory /home/anna"
}

setup_q5() {
  sudo useradd -m alice 2>/dev/null || true
  echo "[Q5] User alice created"
}

setup_q6() {
  sudo mkdir -p /home/student/bit
  echo -e "#!/bin/bash\necho 'Deploying...'" | sudo tee /home/student/bit/deploy.sh > /dev/null
  sudo chmod 740 /home/student/bit/deploy.sh
  echo "[Q6] deploy.sh script created with owner-only full permissions"
}

setup_q7() {
  echo "Budget details" | sudo tee /home/student/bit/budget.xls > /dev/null
  sudo chmod 660 /home/student/bit/budget.xls
  echo "[Q7] budget.xls created and other permissions removed"
}

setup_q8() {
  sudo useradd -m john 2>/dev/null || true
  echo "Report content" | sudo tee /home/student/bit/report.docx > /dev/null
  echo "[Q8] report.docx created; user john added"
}

setup_q9() {
  echo "[Q9] Installing Docker..."
  sudo apt update -y
  sudo apt install -y docker.io
  sudo systemctl enable docker
  sudo systemctl start docker
  echo "[Q9] Docker installed and enabled"
}

setup_q10() {
  echo "[Q10] Installing bluetooth service if missing..."
  sudo apt update -y
  sudo apt install -y bluetooth bluez
  sudo systemctl enable bluetooth
  sudo systemctl start bluetooth
  echo "[Q10] Bluetooth service enabled for disabling test"
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
