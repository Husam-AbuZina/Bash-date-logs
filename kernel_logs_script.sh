#!/bin/bash

LOG_DIR="/var/log"
OUTPUT_DIR="/home/husam/Bashfiles/Result/"
DBXCLI="/home/husam/Bashfiles/dbxcliFolder/dbxcli-linux-amd64"


DATE=$(date +"%Y-%m-%dT%H-%M")
LOG_FILE="kernel-logs-$DATE.txt"
COMPRESSED_FILE="kernel-logs-$DATE.tar.bz2"

journalctl -k -S "1 hour ago" > "$OUTPUT_DIR/$LOG_FILE"

tar -cjf "$OUTPUT_DIR/$COMPRESSED_FILE" -C "$OUTPUT_DIR" "$LOG_FILE"

$DBXCLI upload "$OUTPUT_DIR/$COMPRESSED_FILE" "/Dropbox/Folder/"

rm "$OUTPUT_DIR/$LOG_FILE" "$OUTPUT_DIR/$COMPRESSED_FILE"

