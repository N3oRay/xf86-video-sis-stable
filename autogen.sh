#! /bin/sh

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

ORIGDIR=`pwd`
cd $srcdir

autoreconf -v --install || exit 1
cd $ORIGDIR || exit $?

CFLAGS_ABI="-march=core2 -mcpu=core2 -mtune=core2 -mfpmath=sse -mssse3 -mhard-float"

$srcdir/configure \
		CFLAGS="$CFLAGS_ABI -O3 -fomit-frame-pointer -fno-strict-aliasing -Werror-implicit-function-declaration \
			-Wno-discarded-qualifiers -Wno-stringop-overflow -DNDEBUG -pipe" \
		--disable-static --prefix=/usr "$@"
