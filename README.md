# App::Prove plugin to auto load lua modules
Designed to work with `nginx` + `lua` module without `openresty`.
Extracts and uses `--modules-path` compile options from `nginx`.

## install
```bash
cpanm https://github.com/luatoolz/App-Prove-Plugin-NginxModules.git
```

## usage
- `prove -PNginxModules t`: loads `ndk_http_module` (always added) and `ngx_http_lua_module` by default

You may cpecify modules list (any format accepted):
- `prove -PNginxModules=ngx_http_lua_module,ngx_http_echo_module.so t`
- `prove -PNginxModules=ngx_http_lua_module.so,ngx_http_echo_module t`

## .proverc
```rc
-l
-r t
-PNginxModules
```

## TODO
- github actions: upload to CPAN
- support full/relative path
- more respect `$ENV{TEST_NGINX_LOAD_MODULES}`
