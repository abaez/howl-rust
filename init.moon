--- rust lexer for howl from [ta-rust](https://bitbucket.org/a_baez/ta-rust)
-- See @{README.md} for details on usage.
-- @author [Alejandro Baez](https://keybase.io/baez)
-- @copyright 2016
-- @license MIT (see LICENSE)
-- @module rust

mode_reg =
  name: 'rust'
  aliases: 'rust'
  extensions: 'rs'
  create: -> bundle_load('rust_mode')
  parent: 'curly_mode'

howl.mode.register mode_reg

unload = -> howl.mode.unregister 'rust'

return {
  info:
    author: 'Alejandro Baez https://keybase.io/baez',
    description: 'Rust language support',
    license: 'MIT',
  :unload
}
