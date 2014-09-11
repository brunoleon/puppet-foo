class foo::explicit {
  $bar = hiera_array('foo::databinding::bar')
  notify { $bar: }
}
