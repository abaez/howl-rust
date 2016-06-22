--- rust lexer for howl from [ta-rust](https://bitbucket.org/a_baez/ta-rust)
-- See @{README.md} for details on usage.
-- @author [Alejandro Baez](https://keybase.io/baez)
-- @copyright 2016
-- @license MIT (see LICENSE)
-- @module rust

howl.aux.lpeg_lexer ->
  c = capture
  -- shorthand for lexer.word
  w = (alpha + '_')^1 + (alpha + digit + '_')^0

  -- Whitespace.
  ws = c 'whitespace', space

  -- Comments.
  line_comment = P'//' * scan_until eol
  block_comment = span '/*', '*/'
  comment = c 'comment', any {line_comment, block_comment}

  -- Strings.
  dq_str = span '"', '"', '\\'
  raw_str = span '#"', '#'
  string  = c 'string', any {dq_str, raw_str}


  -- Numbers.
  number = c 'number', any {
    float,
    hexadecimal,
    octal,
    '0b' * (R'01' + '_')^1,
    (digit + '_')^1 -- decimal integer
  }

  -- Keywords.
  keywords = c 'keyword', word {
    'abstract',   'alignof',    'as',       'become',   'box',
    'break',      'const',      'continue', 'crate',    'do',
    'else',       'enum',       'extern',   'false',    'final',
    'fn',         'for',        'if',       'impl',     'in',
    'let',        'loop',       'macro',    'match',    'mod',
    'move',       'mut',        "offsetof", 'override', 'priv',
    'proc',       'pub',        'pure',     'ref',      'return',
    'Self',       'self',       'sizeof',   'static',   'struct',
    'super',      'trait',      'true',     'type',     'typeof',
    'unsafe',     'unsized',    'use',      'virtual',  'where',
    'while',      'yield'
  }

  -- Library Types.
  library = R'AZ' * (R'az' + digit)^1

  -- Lifetimes.
  lifetime = "'" * alpha

  -- Primitive Types.
  primitive = word {
    'bool', 'isize', 'usize', 'char', 'str',
    'u8', 'u16', 'u32', 'u64', 'i8', 'i16', 'i32', 'i64',
    'f32','f64',
  }

  type = c 'type', any {library, lifetime, primitive}

  -- Identifiers.
  identifier = c 'identifier', w

  -- Operators.
  operator = c 'operator', S'+-/*%<>!=`^~@&|?#~:;,.()[]{}'

  -- Attributes.
  attribute = (P'#![' + P'#[') * scan_until(eol + P']')

  -- Syntax extensions.
  extension = w^1 * S'!'

  -- Character.
  char = span("'", "'", '\\')

