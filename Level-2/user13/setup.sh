#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

setup_q1() {
  mkdir -p /home/student/logs
  touch /home/student/logs/session.log
  echo "Session Started" >> /home/student/logs/session.log
  echo "Q1 setup: session.log created with 'Session Started'"
}

setup_q2() {
  mkdir -p /home/student/projects
  echo "Existing Content" > /home/student/projects/readme.txt
  echo "Q2 setup: readme.txt created with placeholder content"
}

setup_q3() {
  sudo id laura &>/dev/null || sudo useradd laura
  sudo usermod -L laura
  echo "Q3 setup: User laura created and locked"
}

setup_q4() {
  sudo id olivia &>/dev/null || sudo useradd olivia
  sudo groupadd admin 2>/dev/null
  sudo groupadd dev 2>/dev/null
  sudo usermod -aG admin,dev olivia
  echo "Q4 setup: User olivia added to admin and dev groups"
}

setup_q5() {
  sudo id luke &>/dev/null || sudo useradd luke
  echo "Q5 setup: User luke created"
}

setup_q6() {
  mkdir -p /home/student/work
  echo "Project notes" > /home/student/work/project.txt
  chmod 640 /home/student/work/project.txt
  echo "Q6 setup: project.txt created with permissions 640"
}

setup_q7() {
  mkdir -p /home/student/bit
  echo "doc1 content" > /home/student/bit/doc1.txt
  echo "doc2 content" > /home/student/bit/doc2.txt
  chmod +r /home/student/bit/doc1.txt /home/student/bit/doc2.txt
  echo "Q7 setup: doc1.txt and doc2.txt created as readable"
}

setup_q8() {
  echo "Q8 setup: No setup required (view command)"
}

setup_q9() {
  sudo systemctl set-default multi-user.target
  echo "Q9 setup: Default target set to multi-user"
}

setup_q10() {
  sudo systemctl set-default graphical.target
  echo "Q10 setup: Default target set to graphical"
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
