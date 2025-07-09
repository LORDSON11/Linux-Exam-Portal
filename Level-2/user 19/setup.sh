#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./setup.sh <question_number|all>"; exit 1; }

echo "Setting up for Question $QNO..."

setup_q1() {
  touch dummy.txt
  echo "[Q1] Dummy file created to show ls output."
}

setup_q2() {
  echo "Initial Log" > log.txt
  echo "[Q2] log.txt initialized."
}

setup_q3() {
  echo -e '#!/bin/bash\necho "Output"; ls /nonexistent' > script.sh
  chmod +x script.sh
  echo "[Q3] script.sh created with intentional error."
}

setup_q4() {
  echo "[Q4] No setup needed. nano creates file automatically."
}

setup_q5() {
  sudo touch /var/log/syslog
  echo "[Q5] syslog assumed present or created empty for demo."
}

setup_q6() {
  mkdir -p /home/student/bit
  echo -e '#!/bin/bash\necho "Build script"' > /home/student/bit/build.sh
  chmod 700 /home/student/bit/build.sh
  echo "[Q6] build.sh created with permission 700."
}

setup_q7() {
  chmod +t /home/student/bit
  echo "[Q7] Sticky bit applied to /home/student/bit."
}

setup_q8() {
  sudo apt install -y apache2 &>/dev/null
  echo "[Q8] Apache2 installed."
}

setup_q9() {
  echo "[Q9] SSH logs assumed available or will be generated."
}

setup_q10() {
  echo "[Q10] No setup needed."
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

echo " Setup complete for Question $QNO."
exit 0
