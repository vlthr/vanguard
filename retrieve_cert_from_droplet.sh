#!/bin/bash
docker-machine scp "$(docker-machine active):/home/von/bb/vanguard/certs/*" ./orig-certs/
