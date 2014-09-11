class foo::databinding (
  $bar = hiera_array('foo::databinding::bar'),
) {
  notify { $bar: }
}
