#!/usr/bin/env python3
import sys
import requests

BASE_DATA_SOURCES_URL = "http://76c451ca622c.ngrok.io/geo/sources"


def main():
    return requests.request("GET", BASE_DATA_SOURCES_URL).json()


if __name__ == "__main__":
    try:
        print(main())
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)
