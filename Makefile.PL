use ExtUtils::MakeMaker;
 
WriteMakefile(
  ABSTRACT          => 'App::Prove plugin to auto load nginx modules',
  AUTHOR            => 'luatoolz',
  CONFIGURE_REQUIRES  => {
    'ExtUtils::MakeMaker' => 0,
  },
  DISTNAME          => 'NginxModules',
  NAME              => 'App::Prove::Plugin::NginxModules',
  VERSION_FROM      => 'lib/App/Prove/Plugin/NginxModules.pm',
  LICENSE           => 'perl',
  MIN_PERL_VERSION  => '5.010001',
  PREREQ_PM         => {
    'Test::Nginx::Socket::Lua' => 0,
  },
  MAKEFILE_OLD      => '',
  META_MERGE        => {
    "meta-spec" => { version => 2 },
    resources => {
      repository => {
          type => 'git',
          url => 'git://github.com/luatoolz/App-Prove-Plugin-NginxModules.git',
          web => 'https://github.com/luatoolz/App-Prove-Plugin-NginxModules',
      },
    },
  },
);
