#!/bin/bash

mkdir -p "$HOME/"nas/
sudo mount -v -t nfs4 nas:/nas "$HOME/"nas/
