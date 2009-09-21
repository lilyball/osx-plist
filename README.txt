== osx-plist

* http://github.com/kballard/osx-plist
* by Kevin Ballard

== DESCRIPTION:

osx-plist is a Ruby library for manipulating Property Lists natively using the built-in support in OS X.

== REQUIREMENTS:

* CoreFoundation (i.e. Mac OS X)

== INSTALL:

  $ gem sources -a http://gems.github.com/ (you only need to do this once)
  $ gem install kballard-osx-plist

== SOURCE:

osx-plist's git repo is available on GitHub, which can be browsed at:

  http://github.com/kballard/osx-plist

and cloned from:

  git://github.com/kballard/osx-plist.git

== USAGE:

One new module is provided, named OSX::PropertyList. It has the following 2 methods:

==== OSX::PropertyList.load(input, format = false)

Loads the property list from input, which is either an IO, StringIO, or a string. Format is an optional parameter - if false, the return value is the converted property list object. If true, the return value is a 2-element array, the first element being the returned value and the second being a symbol identifying the property list format.

==== OSX::PropertyList.dump(output, obj, format = :xml1)

Dumps the property list object into output, which is either an IO or StringIO. Format determines the property list format to write out. The supported values are :xml1,, :binary1, and :openstep; however, OpenStep format appears to not be supported by the system for output anymore.

The valid formats are :xml1, :binary1, and :openstep. When loading a property list, if the format is something else (not possible under any current OS, but perhaps if a future OS includes another type) then the format will be :unknown.

This module also provides a method on Object:

==== Object#to_plist(format = :xml1)

This is the same as PropertyList.dump except it outputs the property list as a string return value instead of writing it to a stream

This module also provides 2 methods on String:

==== String#blob?

Returns whether the string is a blob.

==== String#blob=

Sets whether the string is a blob.

A blob is a string that's been converted from a <data> property list item. When dumping to a property list, any strings that are blobs are written as <data> items rather than <string> items.

== LICENSE:

(The MIT License)

Copyright (c) 2008 Kevin Ballard

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
