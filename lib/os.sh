function dot_os() {
    export DOT_KERNEL=`uname -s | tr '[:upper:]' '[:lower:]'`
    if [ "$DOT_KERNEL" == "linux" ]; then
        # This is what neofetch does, so I feel safe doing the same
        [ -e /etc/os-release ] && source /etc/os-release
        export DOT_DISTRO=`echo $ID | sed "s/ //g" | tr '[:upper:]' '[:lower:]'`
        export DOT_OS="${DOT_KERNEL}_$DOT_DISTRO"
    fi
    if [ "$DOT_KERNEL" == "dDOTwin" ]; then
        export DOT_DISTRO='macos'
        export DOT_OS="${DOT_KERNEL}_$DOT_DISTRO"
    fi
}
dot_os
