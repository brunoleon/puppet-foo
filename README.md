puppet-foo
==========

Used to report supposed bugs

The code in this repo can be used to show that having a class that calls hiera_array() for its parameters,
the hiera call which is actually used is hiera() i.e returns the most specific value, no merging.

Doing the same call in class body works as expected.

hierarchy:
- %{certname}
- common

mynode.yaml:
---
foo::databinding::bar:
  - 1

common.yaml:
---
foo::databinding::bar: 1
  - 2
  - 3

puppet apply foo/tests/explicit.pp --modulepath=/etc/puppet/environments/infra/modules:/etc/puppet/environments/infra/manifests/sitemodules --environment=infra
Notice: Compiled catalog for 775ace81 in environment infra in 0.04 seconds
Notice: 1
Notice: /Stage[main]/Foo::Explicit/Notify[1]/message: defined 'message' as '1'
Notice: 3
Notice: /Stage[main]/Foo::Explicit/Notify[3]/message: defined 'message' as '3'
Notice: 2
Notice: /Stage[main]/Foo::Explicit/Notify[2]/message: defined 'message' as '2'
Notice: Finished catalog run in 0.19 seconds

puppet apply foo/tests/databinding.pp --modulepath=/etc/puppet/environments/infra/modules:/etc/puppet/environments/infra/manifests/sitemodules --environment=infra
Notice: Compiled catalog for 775ace81 in environment infra in 0.04 seconds
Notice: 1
Notice: /Stage[main]/Foo::Databinding/Notify[1]/message: defined 'message' as '1'
Notice: Finished catalog run in 0.22 seconds
