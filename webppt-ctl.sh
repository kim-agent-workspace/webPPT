#!/bin/bash
# webPPT 服务器管理脚本
# 用法: bash ~/code/kim/webppt-ctl.sh {start|stop|restart|status}
PORT=55435
DIR=$HOME/code/kim/webPPT
LOG=/tmp/webppt-server.log
PID_FILE=/tmp/webppt-server.pid

start() {
    if [ -f $PID_FILE ] && kill -0 $(cat $PID_FILE) 2>/dev/null; then
        echo "webPPT 服务器已在运行 (PID: $(cat $PID_FILE))"
        return
    fi
    cd $DIR
    nohup python3 -m http.server $PORT --bind 0.0.0.0 > $LOG 2>&1 &
    echo $! > $PID_FILE
    echo "webPPT 已启动 · PID: $(cat $PID_FILE) · 端口: $PORT"
}

stop() {
    if [ -f $PID_FILE ]; then
        PID=$(cat $PID_FILE)
        kill $PID 2>/dev/null && echo "webPPT 已停止 (PID: $PID)"
        rm -f $PID_FILE
    else
        echo "webPPT 未在运行"
    fi
}

status() {
    if [ -f $PID_FILE ] && kill -0 $(cat $PID_FILE) 2>/dev/null; then
        echo "webPPT 运行中 · PID: $(cat $PID_FILE) · 端口: $PORT"
        echo "已部署的 PPT:"
        for d in $DIR/*/; do
            [ -f "$d/index.html" ] && echo "  → /$(basename $d)/"
        done
    else
        echo "webPPT 未在运行"
    fi
}

case "$1" in
    start) start ;;
    stop) stop ;;
    restart) stop; sleep 1; start ;;
    status) status ;;
    *) echo "用法: $0 {start|stop|restart|status}" ;;
esac
