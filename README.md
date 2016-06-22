# howl-rust
[![twitter][1i]][1p]
[![license][2i]][2p]

A reimagination of [ta-rust] but for [howl].

### DESCRIPTION
I have been a strong follower of the [textadept] world of editor things. It has served me well throughout the years and is an excellent tool for many reasons. However, it's always good to try something new and why not do a full conversion to [howl] of my first plugin of [textadept] to see how it goes? This is that task.

Currently, the bundle has full lexer implementation of [rust] based off of [ta-rust].

#### To Do:

* 1:1 interpretation of the [ta-rust] on [howl].

### USAGE
All you really need is to clone the repository into your `_USERHOME/bundles` directory. You can achieve this simply by first making sure the directory exist and then cloning the repository:

```
mkdir -p ~/.howl/bundles
hg clone https://a_baez@bitbucket.org/a_baez/howl-rust ~/.howl/bundles/rust
```
And that's it! You are good to go with having a lexer for [rust] on [howl]!

[rust]: http://www.rust-lang.org/
[ta-rust]: https://bitbucket.org/a_baez/ta-rust
[howl]: https://howl.io
[textadept]: http://foicica.com/textadept

[1i]: https://img.shields.io/badge/twitter-a_baez-blue.svg
[1p]: https://twitter.com/a_baez
[2i]: https://img.shields.io/badge/license-MIT-green.svg
[2p]: ./LICENSE
