#!/usr/bin/env python3
import sys
import requests

BASE_DATA_SOURCES_URL = "http://35.195.150.105:5000/geo/data/{}/devices"


def main(uuids):
    owner = uuids[0]
    uuids = uuids[1:]
    devices = requests.request("GET", BASE_DATA_SOURCES_URL.format(owner)).json()['message']
    models = []
    for device in devices:
        if device['uuid'] in uuids:
            models.append(device['model'])
    return ';'.join(models)


if __name__ == "__main__":
    try:
        print(main([*sys.argv[1:]]))
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)
