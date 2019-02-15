#!/bin/bash

for i in `seq 0 99`; do
    echo " === === === "
    if [[ $(uname) == "Darwin" ]]; then
	RUST_DATE=`date -v -${i}d "+%Y-%m-%d"`
	triple=$(uname -m)-apple-darwin
    else
    	RUST_DATE=`date -u -d "-$i days" "+%Y-%m-%d"`
	triple=$(uname -m)-unknown-linux-gnu
    fi
    echo "Checking $RUST_DATE..."
    TOML=`curl -sf https://static.rust-lang.org/dist/$RUST_DATE/channel-rust-nightly.toml`
    if [[ $? -gt 0 ]]; then
        echo "Rust $RUST_DATE does not exist"
    else
        if [ ! -z "$(echo $TOML|grep "rls-nightly-$triple.tar.gz")" ] &&
	    [ ! -z "$(echo $TOML|grep "rustfmt-nightly-$triple.tar.gz")" ]; then
            echo "Rust $RUST_DATE has both rls and rustfmt"
            echo "Run \"rustup default nightly-$RUST_DATE\" to install it"
            break
        fi
    fi
done
