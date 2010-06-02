#!/usr/bin/env bash

cd ${0%/*}/..
export LIBERTY_HOME=$(pwd)
cd target

export LOG=${LOG:-$LIBERTY_HOME/work/compile_plugins.log}

. $LIBERTY_HOME/work/tools.sh

eval `se -environment | grep -v '^#'`
SE_SYS=${SE_SYS%/}

n=$(find $SE_SYS/plugins -name c -type d | wc -l)
i=0

find $SE_SYS/plugins -name c -type d | while read plugin; do
    plugin_dir=${plugin#$SE_SYS/}
    plugin_dir=${plugin_dir%/c}
    plugin_name=${plugin_dir##*/}
    plugin_so=${plugin_dir}.so
    plugin_h=${plugin_dir}~.h
    plugin_c=${plugin_dir}~.c
    plugin_dir=${plugin_dir%/*}

    test -d $plugin_dir || mkdir -p $plugin_dir

    progress 30 $((i*3)) $((n*3)) "Generating header file for $plugin_so"

    {
	cat <<EOF
#ifndef __LIBERTY_PLUGIN__
#define __LIBERTY_PLUGIN__

#include "base.h"
#include <errno.h>

EOF
	if [ "$(echo $plugin/*.h)" != "$plugin"'/*.h' ]; then
	    for f in $plugin/*.h; do
		echo '#include "'${f##*/}'"'
	    done
	fi

	echo

	find $path_liberty -name \*.e -exec grep -Hn 'location: "${sys}/plugins"' {} \; | \
	    awk -F: '{print $1}' | uniq | \
	    xargs -n1 awk '/module_name: "'$plugin_name'"/ { i=1 } /feature_name: "[^"]*"/ { if (i) printf("%s %s\n", ARGV[1], $2); i=0 }' | \
	    sed 's/"\([^"]*\)"/\1/g' | sort -u | \
	    while read file symbol; do
	    	cat $file | grep -C5 'feature_name: "'$symbol'"' | $LIBERTY_HOME/work/find_feature.py header $symbol ${file##*/}
	done | sort -u

	echo '#endif'
    } > $plugin_h

    progress 30 $((i*3+1)) $((n*3)) "Generating code file for $plugin_so"

    {
	cat <<EOF
#include "${plugin_h##*/}"

EOF
	if [ "$(echo $plugin/*.c)" != "$plugin"'/*.c' ]; then
	    for f in $plugin/*.c; do
		echo '#include "'${f##*/}'"'
	    done
	fi

	echo

	find $path_liberty -name \*.e -exec grep -Hn 'location: "${sys}/plugins"' {} \; | \
	    awk -F: '{print $1}' | uniq | \
	    xargs -n1 awk '/module_name: "'$plugin_name'"/ { i=1 } /feature_name: "[^"]*"/ { if (i) printf("%s %s\n", ARGV[1], $2); i=0 }' | \
	    sed 's/"\([^"]*\)"/\1/g' | sort -u | \
	    while read file symbol; do
	    	cat $file | grep -C5 'feature_name: "'$symbol'"' | $LIBERTY_HOME/work/find_feature.py code $symbol ${file##*/}
	done | sort -u
    } > $plugin_c

    progress 30 $((i*3+2)) $((n*3)) "Building $plugin_so"

    run gcc -iquote $plugin -iquote $SE_SYS/runtime/c -iquote $plugin_dir -shared -fpic -fvisibility=hidden -o $plugin_so $plugin_c

    i=$((i+1))
done

progress 30 $n $n "done."
