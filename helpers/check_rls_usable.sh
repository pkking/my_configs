#!/bin/bash
case "$(uname -s)" in
    Darwin)
	  triple=$(uname -m)-apple-darwin
      ;;
    Linux)
	  triple=$(uname -m)-unknown-linux-gnu
      ;;
    CYGWIN*|MINGW*|MSYS*)
	  triple=$(uname -m)-pc-windows-msvc
      ;;
    *)
      echo 'other OS' 
	  exit 1
      ;;
esac

for i in `seq 0 99`; do
    echo " === === === "
    if [[ $(uname) == "Darwin" ]]; then
		RUST_DATE=`date -v -${i}d "+%Y-%m-%d"`
    else
    	RUST_DATE=`date -u -d "-$i days" "+%Y-%m-%d"`
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


case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
     ;;

   Linux)
     echo 'Linux'
     ;;

   CYGWIN*|MINGW32*|MSYS*)
     echo 'MS Windows'
     ;;

   # Add here more strings to compare
   # See correspondence table at the bottom of this answer

   *)
     echo 'other OS' 
     ;;
esac