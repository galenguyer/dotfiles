#!/usr/bin/env bash
# This file is loaded at the start of every script
# Keep it minimal

[ ! $DOT_SPLASH ] \
    && echo -en "\n \x1b[30;44m \x1b[0m .dotfiles\n \x1b[30;44m \x1b[0m version 1\n\n" \
    && export DOT_SPLASH=1

# Logs
function log() {
    # Default echo args
    local logEchoArgs="-e"
    local logString=""
    local logLevel=0

    # Get things set up for each log level
    case $1 in
        silly)
            logLevel=0
            logString+="\x1b[30;47msill\x1b[0m "
            ;;
        verb)
            logLevel=1
            logString+="\x1b[34;40mverb\x1b[0m "
            ;;
        info)
            logLevel=2
            logString+="\x1b[36minfo\x1b[0m "
            ;;
        warn)
            logLevel=3
            logString+="\x1b[31;40mWARN\x1b[0m "
            ;;
        error)
            logLevel=4
            logString+="\x1b[30;43mERR!\x1b[0m "
            ;;
        tell)
            logLevel=5
            logString+="\x1b[32mtell\x1b[0m "
            ;;
        ask)
            logLevel=5
            logString+="\x1b[32mask:\x1b[0m "
            logEchoArgs="-en"
            ;;
    esac

    # If $DOT_MODULE is set, prefix the log message
    [ "$DOT_MODULE" ] \
        && logString+="\x1b[35m$DOT_MODULE\x1b[0m "
    [ "$DOT_LOG_PREFIX" != "" ] \
        && logString+="\x1b[32m($DOT_LOG_PREFIX)\x1b[0m "
    # Add the rest of the arguments (merged together) to $logString
    logString+="${*:2}"

    # Don't print log if it's below our log level, and make sure to always show "ask" and "tell" log levels
    [ "$DOT_LOGLEVEL" ] && [[ $logLevel -lt $DOT_LOGLEVEL ]] && [[ $logLevel -lt 5 ]] \
        && return

    echo $logEchoArgs "$logString"
}
