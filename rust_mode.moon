--- rust mode for howl from [ta-rust](https://bitbucket.org/a_baez/ta-rust)
-- See @{README.md} for details on usage.
-- @author [Alejandro Baez](https://keybase.io/baez)
-- @copyright 2016
-- @license MIT (see LICENSE)
-- @module mode

{
  lexer: bundle_load('rust_lexer')
  comment_syntax: {'//', '/*', '*/'}
  auto_pairs: {
    '(': ')'
    '[': ']'
    '{': '}'
    '"': '"'
  }

  default_config:
    use_tabs: false
    tab_width: 4
    indent: 4
    edge_column: 99
}
