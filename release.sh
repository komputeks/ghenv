#!/data/data/com.termux/files/usr/bin/bash

set -e

VERSION="${1:-}"

if [ -z "$VERSION" ]; then
    echo "Usage: ./release.sh VERSION"
    echo "Example: ./release.sh 1.0.0"
    exit 1
fi

case "$VERSION" in
    *.*.*)
        ;;
    *)
        echo "Version must look like 1.0.0"
        exit 1
        ;;
esac

git diff --exit-code

git add .

git commit -m "release: ghenv v$VERSION"

git push origin main

git tag -a "v$VERSION" -m "ghenv v$VERSION"

git push origin "v$VERSION"

echo
echo "Released ghenv v$VERSION"