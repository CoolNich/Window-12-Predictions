if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = /dev/tty1 ]; then
  until curl -s http://127.0.0.1:8080/health >/dev/null; do sleep 1; done
  exec cage -s -- chromium --kiosk --ozone-platform=wayland --no-first-run \
    --disable-infobars --user-data-dir=/tmp/chromium http://127.0.0.1:8080/
fi
