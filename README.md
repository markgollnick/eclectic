Eclectic
========

Eclectic Can Let Eclipse Change The IDE Config.


Rationale
---------

* Despite the claim that Eclipse plugins are only loaded on an as-needed basis,
  this does not always seem to be the case.

    * I'm looking at you, ADT.

* When writing Java for Android vs. C for Atmel AVR vs. Python for Django,
  sometimes workspaces just aren't enough; it's the plugins themselves that
  need to be swapped out.

    * One Solution: Multiple Eclipse installations... But that's a bit "ew..."

* The real solution: One installation, multiple configurations.


Requirements
------------

* Eclipse (Eclipse Classic recommended)


Usage
-----

* Place the batch/shell script in the same directory as your Eclipse binary.
* Run it from within that directory.

1. On first run, it'll ask you for a configuration name. Give it one. Any one.
2. Install some plugins.
3. Launch Eclipse with Eclectic again. It'll list your previously used configs.
4. Give it an existing or a brand new configuration name.
5. Eclipse will load, either with the expected plugins, or with a clean slate.

* To remove a configuration, just delete `eclipse/configs/[config name]`.

Works great for separating languages and their relevant plugins:

* Java ([JD-Eclipse][])
* Android ([ADT][])
* C/C++ ([CDT][])
* Python ([PyDev][])
* C for Atmel AVR ([AVREclipse][])
* etc....

[JD-Eclipse]: http://java.decompiler.free.fr/?q=jdeclipse
[ADT]: https://developer.android.com/sdk/index.html
[CDT]: http://eclipse.org/cdt/
[PyDev]: http://pydev.org/
[AVREclipse]: http://avr-eclipse.sourceforge.net/wiki/index.php/The_AVR_Eclipse_Plugin


License
-------

Boost Software License, Version 1.0: <http://www.boost.org/LICENSE_1_0.txt>


Acknowledgements
----------------

This is little more than a wrapper script for Eclipse's built-in
`-configuration` argument. Thanks go to [zvikico][] for pointing it out on
Stack Overflow:

* <http://stackoverflow.com/a/1426452>
* <http://stackoverflow.com/a/3693830>

[zvikico]: http://stackoverflow.com/users/2823/zvikico
