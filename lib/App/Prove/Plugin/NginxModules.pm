package App::Prove::Plugin::NginxModules;
{
  $App::Prove::Plugin::NginxModules::VERSION = '0.001';
}

# ABSTRACT: App::Prove plugin to auto load nginx modules

use strict;
use warnings;

sub ngx_load_modules {
  my ($modpath) = `nginx -V 2>&1` =~ m/\-\-modules\-path\=(\S+)/ or die 'nginx/nginx module path not found';
  my @args = @_;
  @args=$args[0] if (scalar(@args) && ref($args[0]) eq 'ARRAY');
  my @list = map { /^(.+?)(?:\.so)?$/ } @args;
  unshift(@list, 'ndk_http_module');
  return join " ", map {"$modpath/$_.so"} (do { my %seen; grep { !$seen{$_}++ } (@list) });
}

my $ok = ngx_load_modules('ngx_http_lua_module');
$ok eq ngx_load_modules('ngx_http_lua_module.so')
  eq ngx_load_modules('ndk_http_module', 'ngx_http_lua_module')
  eq ngx_load_modules('ndk_http_module', 'ngx_http_lua_module.so')
  eq ngx_load_modules('ndk_http_module.so', 'ngx_http_lua_module')
  eq ngx_load_modules('ndk_http_module.so', 'ngx_http_lua_module.so') or die 'App::Prove::Plugin::NginxModules test failed';

sub load {
  my ($class, $p) = @_;
  my @args = @{$p->{args}};
  unshift @args, 'ngx_http_lua_module' if !scalar(@args);
  $ENV{TEST_NGINX_LOAD_MODULES} = ngx_load_modules(@args);
  $ENV{'TEST_NGINX_LOAD_MODULES'} = ngx_load_modules(@args);
}

1;

__END__
=pod

=head1 NAME

App::Prove::Plugin::NginxModules - App::Prove plugin to auto load nginx modules

=head1 VERSION

version 0.001

=head1 SYNOPSIS

  # command-line usage
  prove -PNginxModules
  prove -PNginxModules=ngx_http_lua_module,ngx_http_echo_module

=head1 DESCRIPTION

This L<prove> plugin lets you load nginx modules automatically. It is
particularly handy in C<.proverc>.

Default loads:
  ndk_http_module
  ngx_http_lua_module

=head1 BUGS

Due to the way L<App::Prove> splits argumets to plugins, it is not
possible to set values containing commas.

=head1 SUPPORT

This module is managed in an open L<GitHub
repository|https://github.com/luatoolz/App-Prove-Plugin-NginxModules>.
Feel free to fork and contribute, or to clone 
L<https://github.com/luatoolz/App-Prove-Plugin-NginxModules.git> and
send patches!

Found a bug? Please
L<post|https://github.com/luatoolz/App-Prove-Plugin-NginxModules/issues>
a report!

=head1 SEE ALSO

L<prove>, L<App::Prove/PLUGINS>.

=head1 AUTHOR

L<luatoolz|https://github.com/luatoolz>

=head1 COPYRIGHT AND LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

