#!/usr/bin/env python3
import sys
import requests

BASE_DATA_SOURCES_URL = "http://172.18.0.21:80/geo/sources"


def main():
    return requests.request("GET", BASE_DATA_SOURCES_URL).json()


if __name__ == "__main__":
    try:
        print(main())
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)