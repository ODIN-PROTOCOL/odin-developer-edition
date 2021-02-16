#!/usr/bin/env python3
import sys


def main():
    return "Hello, World!"


if __name__ == "__main__":
    try:
        print(main())
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)
