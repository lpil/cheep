# Cheep

[![Build Status](https://travis-ci.org/lpil/cheep.svg?branch=master)](https://travis-ci.org/lpil/cheep)
[![Code Climate](https://codeclimate.com/github/lpil/cheep/badges/gpa.svg)](https://codeclimate.com/github/lpil/cheep)

Graphical programming isn't fun, so here's a Ruby DSL for writing
[Pure Data](http://puredata.info/) patches.

~~~ruby
osc = Cheep.osc! 440
dac = Cheep.dac!
dac[osc, osc]
~~~

Compiles to...

![compiled patch](https://raw.githubusercontent.com/lpil/cheep/master/resource/intro-example.png)

# Usage

Ruby doesn't really like `~` in identifiers, so signal effecting objects use
`!` as a suffix.

`dac~` becomes `dac!`.  
`osc~` becomes `osc!`.

### Licence

    Copyright © 2015 Louis Pilfold. All Rights Reserved.

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
