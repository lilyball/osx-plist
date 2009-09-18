#!/usr/bin/ruby
require 'mkmf'
$LDFLAGS += ' -framework CoreFoundation -undefined suppress -flat_namespace'
$LIBRUBYARG_SHARED=""
create_makefile("osx/plist")
