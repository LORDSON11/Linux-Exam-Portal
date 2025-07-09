#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

verify_q1() {
  grep -q "This is Part B" /home/student/summary/partA.txt && echo "1" || echo "0"
}

verify_q2() {
  [ "$(wc -l < /home/student/logs/mid_lines.txt)" = "10" ] && echo "1" || echo "0"
}

verify_q3() {
  [ ! -f /var/spool/mail/tempuser ] && echo "1" || echo "0"
}

verify_q4() {
  grep -q "nash" /etc/passwd && grep -q "nologin" /etc/passwd && echo "1" || echo "0"
}

verify_q5() {
  [ -d /home/old_bob ] && [ -f /home/old_bob/data.txt ] && echo "1" || echo "0"
}

verify_q6() {
  [ ! -x /home/student/bit/shutdown.sh ] && echo "1" || echo "0"
}

verify_q7() {
  perms=$(stat -c "%a" /home/student/bit/collab.txt)
  [ "$perms" = "674" ] || [ "$perms" = "764" ] || [ "$perms" = "774" ] || [ "$perms" = "764" ] || [ "$perms" = "764" ] && echo "1" || echo "0"
}

verify_q8() {
  systemctl is-enabled bluetooth | grep -q "disabled" && echo "1" || echo "0"
}

verify_q9() {
  systemctl is-enabled vsftpd 2>/dev/null | grep -q "masked" && echo "1" || echo "0"
}

verify_q10() {
  systemctl is-enabled vsftpd 2>/dev/null | grep -vq "masked" && echo "1" || echo "0"
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
  *) echo "0"; exit 1 ;;
esac

exit 0
