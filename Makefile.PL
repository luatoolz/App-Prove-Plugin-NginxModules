use ExtUtils::MakeMaker;
 
WriteMakefile(
  ABSTRACT      => "App::Prove plugin to auto load nginx modules",
  AUTHOR        => "Lua Toolz",
  CONFIGURE_REQUIRES  => {
    "ExtUtils::MakeMaker" => 0,
  },
  DISTNAME      => 'NginxModules',
  NAME          => 'App::Prove::Plugin::NginxModules',
  VERSION_FROM  => 'lib/App/Prove/Plugin/NginxModules.pm',
  LICENSE           => 'perl',
  MIN_PERL_VERSION  => '5.012000',
  PREREQ_PM         => {
    "Test::Nginx::Socket::Lua" => 0,
  },
);
