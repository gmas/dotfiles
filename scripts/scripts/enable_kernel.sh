# /bin/sh
set -ueo pipefail
# set -x 

BOOT_DIR="/boot"
FILES=("vmlinuz-linux-$1" "initramfs-linux-$1.img" "System.map-$1")
MISSING_FILES=()

function find_missing_files() {
  for _fname in "${FILES[@]}"
  do
    _file="$BOOT_DIR/$_fname"
    if [ ! -e $_file ]
      then
        MISSING_FILES+=($_file)
    fi
  done
}

find_missing_files 


if [ ${#MISSING_FILES[@]} -gt 0 ]; then
  for _file in "${MISSING_FILES[@]}"
  do
    echo "MISSING: $_file"
  done
  exit 1
fi

echo "Creating symlinks..."
set -x
ln -sf "/boot/System.map-$1" /boot/System.map
ln -sf "/boot/vmlinuz-linux-$1" /boot/vmlinuz-linux
ln -sf "/boot/initramfs-linux-$1.img" /boot/initramfs-linux.img
