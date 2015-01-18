# Cheep

Graphical programming isn't fun, so here's a Ruby DSL for writing
[Pure Data](http://puredata.info/) patches.

# Usage

Ruby doesn't really like `~` in identifiers, so signal effecting objects use
`!` as a prefix. `dac~` becomes `dac!`

### Licence

    Copyright © 2015 Louis Pilfold. All Rights Reserved.

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
