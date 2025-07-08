#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

verify_q1() {
  if [ -f "/home/student/notices/announcement.txt" ]; then
    echo "1"
  else
    echo "0"
  fi
}

verify_q2() {
  if [ -f "/home/student/reports/report.txt" ]; then
    grep -Fxq "Project Report Submitted Successfully." /home/student/reports/report.txt && echo "1" || echo "0"
  else
    echo "0"
  fi
}

verify_q3() {
  if [ -f "doc_list.txt" ]; then
    if grep -q "$(date +%Y)" doc_list.txt; then
      echo "1"
    else
      echo "0"
    fi
  else
    echo "0"
  fi
}

verify_q4() {
  if id "john" &>/dev/null && [ -d "/home/john" ]; then
    echo "1"
  else
    echo "0"
  fi
}

verify_q5() {
  if ! id "mike" &>/dev/null && [ ! -d "/home/mike" ]; then
    echo "1"
  else
    echo "0"
  fi
}

verify_q6() {
  if [ -x "/home/student/bit/cleanup.sh" ]; then
    echo "1"
  else
    echo "0"
  fi
}

verify_q7() {
  if [ -f "/home/student/bit/personal_notes.txt" ]; then
    perms=$(stat -c "%a" /home/student/bit/personal_notes.txt)
    [ "$perms" = "600" ] && echo "1" || echo "0"
  else
    echo "0"
  fi
}

verify_q8() {
  if [ -f "/home/student/bit/policy.pdf" ]; then
    perms=$(stat -c "%a" /home/student/bit/policy.pdf)
    [ "$perms" = "444" ] && echo "1" || echo "0"
  else
    echo "0"
  fi
}

verify_q9() {
  status=$(systemctl is-active apache2 2>/dev/null)
  [ "$status" = "active" ] && echo "1" || echo "0"
}

verify_q10() {
  status=$(systemctl is-active ssh 2>/dev/null)
  [ "$status" = "active" ] && echo "1" || echo "0"
}

# Run the correct check based on input
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
  *)
    echo "0"
    exit 1
    ;;
esac

exit 0
