#!/bin/sh

set -e

# RAUC hook script for Raspberry Pi firmwaree tryboot
# Meant to be usesd as a RAUC bootloader-custom-backend script.

bootargs_a="root=PARTUUID=8d3d53e3-6d49-4c38-8349-aff6859e82fd rootfstype=squashfs ro rauc.slot=A"
bootargs_b="root=PARTUUID=a3ec664e-32ce-4665-95ea-7ae90ce9aa20 rootfstype=squashfs ro rauc.slot=B"

case "$1" in
    get-primary)
        # Actions to be performed when getting the primary bootloader
        # Example: Output the path to the current primary bootloader
        echo "tryboot get-primary" >&2
        if [ ! -f /mnt/boot/bootstate.txt ]; then
            echo "Could not find bootstate.txt!" >&2a
            exit 1
        fi

        echo "$(cut -b 1 /mnt/boot/bootstate.txt)"
        ;;

    set-primary)
        # Actions to be performed when setting the primary bootloader
        # Example: Set the specified bootloader as the primary one
        slot_bootname="$2"
        echo "tryboot set-primary $slot_bootname" >&2
        ;;

    get-state)
        # Actions to be performed when getting the bootloader state
        # Example: Output the current state of the bootloader
        # You need to implement logic to determine the state (good or bad) based on the slot.bootname
        slot_bootname="$2"
        echo "tryboot get-state $slot_bootname" >&2
        echo "good"
        ;;

    set-state)
        # Actions to be performed when setting the bootloader state
        # Example: Set the specified state for the bootloader
        slot_bootname="$2"
        new_state="$3"
        echo "tryboot set-state $slot_bootname $new_state" >&2
        ;;

    get-current)
        # Actions to be performed when getting the current running slot
        # Example: Output the path to the current running bootloader
        # You need to implement logic to determine the current running slot based on your system
        echo "tryboot get-current"  >&2
        echo "A"
        ;;

    *)
        echo "Unknown operation: $1"
        exit 1
        ;;
esac

exit 0
