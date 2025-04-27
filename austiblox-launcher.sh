#!/bin/bash

HTTP_PROXY=""
HTTPS_PROXY=""
SOCKS_PROXY=""
WINEDEBUG=""
WINEPREFIX="$HOME/.wine-austiblox"
WINE_PATH="umu-run"
ACTION="run"
URL=""

# Get the folder where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPDATER_EXE="$SCRIPT_DIR/AustibloxUpdater.exe"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --no-proxy)
            unset HTTP_PROXY HTTPS_PROXY SOCKS_PROXY
            ;;
        --proxy=*)
            proxy="${1#*=}"
            HTTP_PROXY="$proxy"
            HTTPS_PROXY="$proxy"
            SOCKS_PROXY="socks5://$proxy"
            ;;
        --wine-prefix=*)
            WINEPREFIX="${1#*=}"
            ;;
        --wine-path=*)
            WINE_PATH="${1#*=}"
            ;;
        --debug=*)
            WINEDEBUG="${1#*=}"
            ;;
        --regedit)
            ACTION="regedit"
            ;;
        --winecfg)
            ACTION="winecfg"
            ;;
        --iexplore)
            ACTION="iexplore"
            ;;
        --help)
            echo "Usage: $0 [options] [url]"
            echo ""
            echo "Options:"
            echo "  --no-proxy             Disable proxy settings"
            echo "  --proxy=<proxy>        Set custom proxy address"
            echo "  --wine-prefix=<path>   Set custom Wine prefix"
            echo "  --wine-path=<path>     Set custom Wine binary or runner (default: umu-run)"
            echo "  --debug=<flags>        Set Wine debug flags"
            echo "  --regedit              Open Wine Registry Editor"
            echo "  --winecfg              Open Wine Configuration"
            echo "  --iexplore             Open Wine Internet Explorer"
            echo "  --help                 Show this help message"
            exit 0
            ;;
        *)
            URL="${1#*://}"
            ;;
    esac
    shift
done

[ -n "$HTTP_PROXY" ] && export http_proxy="$HTTP_PROXY"
[ -n "$HTTPS_PROXY" ] && export https_proxy="$HTTPS_PROXY"
[ -n "$SOCKS_PROXY" ] && export socks_proxy="$SOCKS_PROXY"

case "$ACTION" in
    run)
        WINEDEBUG="$WINEDEBUG" WINEPREFIX="$WINEPREFIX" "$WINE_PATH" "$UPDATER_EXE" "$URL"
        ;;
    regedit)
        WINEPREFIX="$WINEPREFIX" "$WINE_PATH" regedit
        ;;
    winecfg)
        WINEPREFIX="$WINEPREFIX" "$WINE_PATH" winecfg
        ;;
    iexplore)
        WINEPREFIX="$WINEPREFIX" "$WINE_PATH" iexplore
        ;;
esac

read -p "Press Enter to exit..."
