#!/bin/bash

KEY_DIR="./keys"

if [ ! -d "$KEY_DIR" ]; then
  echo "Create a folder $KEY_DIR..."
  mkdir -p "$KEY_DIR"
fi

read -p "Enter a name for the SSH key: " KEY_NAME

KEY_PATH="$KEY_DIR/$KEY_NAME"

ssh-keygen -t rsa -b 2048 -f "$KEY_PATH"

chmod 600 "${KEY_PATH}"
chmod 644 "${KEY_PATH}.pub"

echo "The SSH key was successfully created in: $KEY_PATH"
