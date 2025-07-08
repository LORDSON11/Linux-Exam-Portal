#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number|all>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

verify_q1() {
  if [ -f /home/student/docs/instructions.txt ]; then
    echo "1"; return 0
  fi
  echo "0"; return 1
}

verify_q2() {
  if [ -f /home/student/configs/config.txt ]; then
    echo "1"; return 0
  fi
  echo "0"; return 1
}

verify_q3() {
  if grep -q "fileA.txt" /home/student/filelist.txt; then
    echo "1"; return 0
  fi
  echo "0"; return 1
}

verify_q4() {
  if id steve &>/dev/null && ! groups steve | grep -q devs; then
    echo "0"; return 1
  fi
  echo "1"; return 0
}

verify_q5() {
  expiry=$(sudo chage -l harry | grep "Account expires" | awk -F: '{print $2}' | xargs)
  if [[ "$expiry" == "Dec 31, 2025" ]]; then
    echo "1"; return 0
  fi
  echo "0"; return 1
}

verify_q6() {
  perms=$(stat -c "%A" /home/student/bit/team.txt)
  if echo "$perms" | grep -q "w" && ! echo "$perms" | grep -q "...w......"; then
    echo "1"; return 0
  fi
  echo "0"; return 1
}

verify_q7() {
  perms=$(stat -c "%A" /home/student/bit/notes.txt)
  if ! echo "$perms" | grep -q "x"; then
    echo "1"; return 0
  fi
  echo "0"; return 1
}

verify_q8() {
  perms=$(stat -c "%A" /home/student/bit/public.html)
  if [[ "$perms" == "drwxr-xr-x" ]]; then
    echo "1"; return 0
  fi
  echo "0"; return 1
}

verify_q9() {
  failed_services=$(systemctl --failed --no-legend)
  if [ -n "$failed_services" ]; then
    echo "1"; return 0
  else
    echo "0"; return 1
  fi
}

verify_q10() {
  status=$(systemctl is-active postgresql)
  if [ "$status" == "inactive" ]; then
    echo "0"; return 1
  else
    echo "1"; return 0
  fi
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
    for i in {1..10}; do
      echo -n "Q$i: "
      ./verify.sh "$i"
    done
    ;;
  *) echo "0"; exit 1 ;;
esac
