puppet-foo
==========

Used to report supposed bugs

The code in this repo can be used to show that having a class that calls hiera_array() for its parameters,
the hiera call which is actually used is hiera() i.e returns the most specific value, no merging.

Doing the same call in class body works as expected.

hierarchy:
- %{certname}
- common
