#!/data/data/com.termux/files/usr/bin/bash

set -e

REPO="komputeks/ghenv"
INSTALL_DIR="$HOME/bin"
TARGET="$INSTALL_DIR/ghenv"

mkdir -p "$INSTALL_DIR"

echo "Installing ghenv..."

curl -fsSL \
    "https://raw.githubusercontent.com/${REPO}/main/ghenv" \
    -o "$TARGET"

chmod +x "$TARGET"

case ":$PATH:" in
    *":$INSTALL_DIR:"*)
        ;;
    *)
        echo
        echo "Add this to ~/.bashrc:"
        echo
        echo 'export PATH="$HOME/bin:$PATH"'
        echo
        ;;
esac

echo
echo "ghenv installed."
echo "Run:"
echo
echo "  $TARGET version"