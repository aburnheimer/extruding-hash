extruding-hash
==============

`extruding-hash` provdes a data structure, based on a Hash of Arrays,
that provides a method or two to gather data together in what can be
considered _bins_.  The Hash functionality provides these _bins_, while
the data values themselves are contained in Arrays, providing the
concept of _columns_.

The `extruding-hash` object has methods where if an added _column_ (in
the form of a Hash) has any _bins_ that the object does not already
contain, the _bin_ will be added, populated with **nil** values for any
_columns_ that had not had a value for that _bin_ - see figure 1:

    Init. State (extruding-hash object)
    Bin       Columns
    ---       -------
    a1|b1     [ 1, 2, 3, 5 ]
    a3|b3     [ 2, 3, 5, 8 ]
    a4|b4     [ 3, 5, 8, 13 ]

    New column (Hash) to be added, note second bin not in extruding-hash object already.
    Bins      Values
    ---       -------
    a1|b1     21
    a2|b2     34
    a4|b4     55

    End. State (extruding-hash object), after column introduced.
    Bin       Columns
    ---       -------
    a1|b1     [ 1,   2,   3,   5,   21 ]
    a2|b2     [ nil, nil, nil, nil, 34 ]
    a3|b3     [ 2,   3,   5,   8,   nil ]
    a4|b4     [ 3,   5,   8,   13   55 ]

              Figure 1

License
-------

`extruding-hash` is licensed under the Creative Commons 3.0 License.
Details can be found in the file LICENSE.

License-file referencing and other doc. formatting taken from
[damiendallimore](https://github.com/damiendallimore "damiendallimore on GitHub").

Install
-------

    gem install extruding-hash

Usage
-----
```ruby
require 'extruding-hash'
data = ExtrudingHash.new
data = { "a1|b1" => [ 1, 2, 3, 5 ], "a3|b3" => [ 2, 3, 5, 8 ],
         "a4|b4" => [ 3, 5, 8, 13 ] }
data << { "a1|b1" => 21, "a2|b2" => 34, "a4|b4" => 55 }
data
=> {"a1|b1"=>[1, 2, 3, 5, 21], "a2|b2"=>[nil, nil, nil, 34],
    "a3|b3"=>[2, 3, 5, 8, nil], "a4|b4"=>[ 3, 5, 8, 13, 55]}
```

Contribute
----------

Please fork the GitHub project (https://github.com/aburnheimer/extruding-hash),
make any changes, commit and push to GitHub, and submit a pull request.
Including tests for your changes would be greatly appreciated!

Contact
-------

This project was initiated by Andrew Burnheimer.

* Email:
  * aburnheimer@gmail.com
* Twitter:
  * @aburnheimer
* Github:
  * https://github.com/aburnheimer/
