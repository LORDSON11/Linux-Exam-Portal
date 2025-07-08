#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; exit 1; }

verify_q1() {
  echo "Q1: Checking if current date is appended in /home/student/logs/log.txt"
  tail -n 1 /home/student/logs/log.txt
}

verify_q2() {
  echo "Q2: Viewing contents and counting lines in /home/student/data/data.txt"
  cat /home/student/data/data.txt
  echo "Line count:"
  wc -l < /home/student/data/data.txt
}

verify_q3() {
  echo "Q3: Verifying redirection of error message to /home/student/errors.txt"
  if [ -s /home/student/errors.txt ]; then
    echo "Error content found:"
    cat /home/student/errors.txt
  else
    echo "No error output found in errors.txt"
  fi
}

verify_q4() {
  echo "Q4: Displaying /etc/passwd entries..."
  grep '^' /etc/passwd | cut -d: -f1
}

verify_q5() {
  echo "Q5: Verifying groups of user 'sara'"
  groups sara
}

verify_q6() {
  echo "Q6: Checking permission match for file2.txt with file1.txt"
  ls -l /home/student/bit/file1.txt
  ls -l /home/student/bit/file2.txt
}

verify_q7() {
  echo "Q7: Verifying umask value and file permission"
  umask
  touch /home/student/bit/test_umask.txt
  ls -l /home/student/bit/test_umask.txt
}

verify_q8() {
  echo "Q8: Verifying runme.sh is executable by all"
  ls -l /home/student/bit/runme.sh
}

verify_q9() {
  echo "Q9: Checking if telnet service is masked"
  systemctl is-enabled telnet 2>/dev/null || echo "Telnet is disabled or masked"
  systemctl status telnet 2>&1 | grep -i 'masked'
}

verify_q10() {
  echo "Q10: Checking if telnet is unmasked"
  systemctl status telnet 2>&1 | grep -i 'Loaded'
}

case "$QNO" in
  1) verify_q1 ;;
  2) verify_q2 ;;
  3) verify_q3 ;;
  4) verify_q4 ;;
  5) verify_q5 ;;
  6) verify_q6 ;;
  7) verify_q7 ;;
  8) verify_q8 ;;
  9) verify_q9 ;;
  10) verify_q10 ;;
  all)
    verify_q1
    verify_q2
    verify_q3
    verify_q4
    verify_q5
    verify_q6
    verify_q7
    verify_q8
    verify_q9
    verify_q10
    ;;
  *) echo "Invalid question number"; exit 1 ;;
esac

exit 0
