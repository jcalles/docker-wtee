while true; do
  sleep 2
  echo "test logs in $(hostname) at $(date +%Y%d%m-%H:%M:%S)" >> test/test.log
done


