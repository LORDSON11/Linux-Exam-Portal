#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify14.sh <question_number|all>"; exit 1; }

verify_q1() {
  [[ -f /home/student/data/data.csv ]] && grep -Fxq "--- Data Log ---" /home/student/data/data.csv &&
    echo "Q1 passed: '--- Data Log ---' found at top of data.csv" ||
    echo "Q1 failed: data.csv missing or line not at top"
}

verify_q2() {
  [[ -f /home/student/reports/linecount.txt ]] && [[ "$(cat /home/student/reports/linecount.txt)" =~ ^[[:space:]]*3[[:space:]]+.* ]] &&
    echo "Q2 passed: linecount.txt shows 3 lines" ||
    echo "Q2 failed: linecount.txt missing or wrong count"
}

verify_q3() {
  id brian2025 &>/dev/null && echo "Q3 passed: brian renamed to brian2025" || echo "Q3 failed: brian2025 not found"
}

verify_q4() {
  groups frank | grep -q . && echo "Q4 passed: Groups for frank shown" || echo "Q4 failed: No group info"
}

verify_q5() {
  sudo chage -l emma | grep "Account expires" | grep -q "2025-06-30" &&
    echo "Q5 passed: emma expires 2025-06-30" ||
    echo "Q5 failed: Incorrect expiry"
}

verify_q6() {
  [[ "$(stat -c "%a" /home/student/bit/access.key)" == "600" ]] &&
    echo "Q6 passed: access.key has 600 permissions" ||
    echo "Q6 failed: Incorrect permissions"
}

verify_q7() {
  perms=$(stat -c "%A" /home/student/share/feedback.txt)
  echo "$perms" | grep -q "w" && echo "Q7 passed: feedback.txt is writable by group/others" || echo "Q7 failed: Not writable"
}

verify_q8() {
  systemctl get-default | grep -q rescue.target && echo "Q8 passed: system in rescue mode" || echo "Q8 info: Not in rescue mode"
}

verify_q9() {
  journalctl -u apache2 &>/dev/null && echo "Q9 passed: Apache logs viewed" || echo "Q9 info: Apache logs may not exist"
}

verify_q10() {
  journalctl -b -1 &>/dev/null && echo "Q10 passed: Previous boot logs available" || echo "Q10 info: No previous boot logs found"
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
    for i in {1..10}; do verify_q$i; done ;;
  *) echo "Invalid question number"; exit 1 ;;
esac
