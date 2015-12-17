#!/bin/bash

#bash macchanger_test.sh | column -t -s :

exitStatus=0

test() {
    if [[ "$1" == "$2" ]]; then
        echo "Test $3: Passed"
    else
        echo "Test $3: Failed"
        exitStatus=1
    fi
}

# Error Tests
test "$(./macchanger -s)" "macchanger: no device specified" "-s error"
test "$(./macchanger --show)" "macchanger: no device specified" "--show error"

test "$(./macchanger -m)" "macchanger: no device or mac address specified" "-m error"
test "$(./macchanger --mac)" "macchanger: no device or mac address specified" "-mac error"

test "$(./macchanger -r)" "macchanger: no device specified" "-r error"
test "$(./macchanger --random)" "macchanger: no device specified" "--random error"

# Test Help
help="usage: macchanger [options] [device]

options:
-m, --mac                 Set the MAC address,    macchanger -m en0 XX:XX:XX:XX:XX:XX
-r, --random              Set random MAC address, macchanger -r en0
-s, --show                Show the MAC address,   macchanger -s en0"
if diff -w <(./macchanger) <(echo "$help") >/dev/null; then
    echo "Test help: Passed"
else
    echo "Test help: Failed" && \
        exitStatus=1
fi

exit "$exitStatus"
