# Module for error handling
# Last modified: 2011-03-09T18:04:49-05:00

# function that immitate perl's die command
die(){
    cat <<-EOF
	$@
EOF
    exit 1
}

# function that immitates echo
nb_msg(){
    cat <<-EOF
	$@
EOF
}

# helper function to test noisy commands quickly by redirecting output to a
# shell variable
nb_eval(){
    if [ "$VERBOSE" != 0 ]; then
	$@
    else
	CMD_WRAPPER=`$@ 2>&1`
    fi
}

# helper function to redirect command output to temp file
nb_null(){
    if [ "$VERBOSE" != 0 ]; then
	$@
    else
	[ -w /dev/null ] && DEV_NULL=/dev/null # when possible use the real /dev/null
	: ${DEV_NULL:=$NB_TEMP_DIR/nb_scratch$$-dev_null}
	$@ > "$DEV_NULL" 2>&1
    fi
}
