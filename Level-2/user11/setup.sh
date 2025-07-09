#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up environment for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/reports
  yes "Sample report line" | head -n 100 > /home/student/reports/overview.txt
  echo "✅ Q1: Created /home/student/reports/overview.txt with 100 lines."
}

setup_q2() {
  sudo mkdir -p /home/student/logs
  echo -e "Line1\nLine2\nLine3\nLine4\nLine5\nLine6" > /home/student/logs/logfile.txt
  echo "✅ Q2: Created /home/student/logs/logfile.txt with 6 lines."
}

setup_q3() {
  sudo groupadd -f devs
  sudo useradd -G devs chris &>/dev/null || true
  echo "✅ Q3: User chris added to devs group."
}

setup_q4() {
  echo "✅ Q4: No file setup needed. Use 'cat /etc/group' manually."
}

setup_q5() {
  sudo useradd tina &>/dev/null || true
  echo "✅ Q5: User tina created."
}

setup_q6() {
  sudo mkdir -p /home/student/bit/dev
  echo 'echo "Dev Start"' > /home/student/bit/dev/start.sh
  chmod 700 /home/student/bit/dev/start.sh
  echo "✅ Q6: Created /home/student/bit/dev/start.sh with restricted permissions."
}

setup_q7() {
  sudo mkdir -p /home/student/.config
  touch /home/student/.config/.settings /home/student/.config/.profile
  echo "✅ Q7: Hidden config files created in /home/student/.config."
}

setup_q8() {
  echo "✅ Q8: No specific setup. Use 'systemctl list-units --type=service'."
}

setup_q9() {
  echo "✅ Q9: No setup required. Use 'journalctl -f' to test manually."
}

setup_q10() {
  echo "✅ Q10: No setup required. Ensure ssh service is enabled to test logs."
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
