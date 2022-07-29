#!/bin/sh

HOST="${PGHOST:-localhost}"
PORT="${PGPORT:-5432}"

COUNT=0

function fib() {
  if [ $1 -le 0 ]; then
    echo 0
  elif [ $1 -eq 1 ]; then
    echo 1
  else
    echo $(( $(fib $(($1 - 1)) ) + $(fib $(($1 - 2)) ) ))
  fi
}

echo "[INFO] Waiting for Database to become ready..."

until nc -z -w 2 $HOST $PORT; do
  COUNT=$((COUNT + 1));
  SLEEP_TIME=$(fib $COUNT);
  echo "[WARNING] Unable to access database! Sleeping $SLEEP_TIME seconds. Waiting for $HOST to listen on $PORT...";
  sleep $SLEEP_TIME;
done;

echo "[INFO] Database OK ✓"
