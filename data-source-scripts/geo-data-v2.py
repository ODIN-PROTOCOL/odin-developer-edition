#!/usr/bin/env python3
import sys
import requests

BASE_DATA_SOURCES_URL = "http://35.195.150.105:5000/geo/data/{}/devices?count=5"


def main():
    devices = requests.request("GET", BASE_DATA_SOURCES_URL).json()['message']
    return ', '.join([device['model'] for device in devices])


if __name__ == "__main__":
    try:
        print(main())
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)
