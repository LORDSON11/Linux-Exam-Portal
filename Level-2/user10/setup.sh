#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up for Question $QNO..."

setup_q1() {
  sudo mkdir -p /home/student/temp
  sudo touch /home/student/temp/quick.txt
  echo "Q1 setup done."
}

setup_q2() {
  sudo mkdir -p /home/student/assignments
  echo "This is intro." | sudo tee /home/student/assignments/intro.txt > /dev/null
  echo "This is conclusion." | sudo tee /home/student/assignments/conclusion.txt > /dev/null
  echo "Q2 setup done."
}

setup_q3() {
  sudo mkdir -p /home/student/data
  echo "Existing data." | sudo tee /home/student/data/record.txt > /dev/null
  echo "Q3 setup done."
}

setup_q4() {
  sudo mkdir -p /home/admin/users
  sudo useradd -m nancy &>/dev/null || true
  echo "Q4 setup done."
}

setup_q5() {
  sudo mkdir -p /home/admin/accounts
  sudo useradd -m victor &>/dev/null || true
  echo "Q5 setup done."
}

setup_q6() {
  sudo mkdir -p /home/student/bit/designs
  sudo groupadd designers &>/dev/null || true
  sudo chgrp designers /home/student/bit/designs
  echo "Q6 setup done."
}

setup_q7() {
  sudo mkdir -p /home/student/bit
  echo -e "#!/bin/bash\numask 002\ntouch newfile.txt" | sudo tee /home/student/bit/myscript.sh > /dev/null
  sudo chmod +x /home/student/bit/myscript.sh
  echo "Q7 setup done."
}

setup_q8() {
  umask 077 && sudo touch /home/student/bit/monitor.sh
  echo "Q8 setup done."
}

setup_q9() {
  echo -e "[Service]\nRestart=always" | sudo tee /etc/systemd/system/nginx.service.d/override.conf > /dev/null
  sudo systemctl daemon-reexec
  sudo systemctl restart nginx
  echo "Q9 setup done."
}

setup_q10() {
  echo "Q10 setup: System logs available, no special setup needed."
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
