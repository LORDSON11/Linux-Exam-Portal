#!/bin/bash

QNO="$1"
[ -z "$QNO" ] && { echo "Usage: ./verify.sh <question_number>"; echo "0"; exit 1; }

echo "Verifying answer for Question $QNO..."

case "$QNO" in
  1)
    if [ -f "/home/student/logs/logfile.txt" ]; then
      tail_count=$(tail -n 10 /home/student/logs/logfile.txt | wc -l)
      [ "$tail_count" -eq 10 ] && echo "1" || echo "0"
    else
      echo "0"
    fi
    ;;

  2)
    [ -f "/home/student/documents/newfile.txt" ] && echo "1" || echo "0"
    ;;

  3)
    grep -q . /home/student/notes/notes.txt && echo "1" || echo "0"
    ;;

  4)
    user_shell=$(getent passwd jake | cut -d: -f7)
    [ "$user_shell" = "/bin/bash" ] && echo "1" || echo "0"
    ;;

  5)
    id elena &>/dev/null && groups elena | grep -q admin && echo "1" || echo "0"
    ;;

  6)
    current_umask=$(umask)
    [ "$current_umask" = "0027" ] && echo "1" || echo "0"
    ;;

  7)
    perms=$(stat -c "%a" /home/student/bit/draft.txt 2>/dev/null)
    [ "$perms" = "700" ] && echo "1" || echo "0"
    ;;

  8)
    perms=$(stat -c "%a" /home/student/bit/instructions.txt 2>/dev/null)
    [ "$perms" = "644" ] && echo "1" || echo "0"
    ;;

  9)
    systemctl is-enabled ssh &>/dev/null && echo "1" || echo "0"
    ;;

  10)
    systemctl list-units --type=service --state=active | grep -q . && echo "1" || echo "0"
    ;;

  *)
    echo "0"
    ;;
esac

exit 0
