alias less="less --raw-control-chars"
if [ -z "$PAGER" ]; then
    export PAGER=less
fi