<h2>mod_swift
  <img src="http://zeezide.com/img/mod_swift.svg"
       align="right" width="128" height="128" />
</h2>

![Apache 2](https://img.shields.io/badge/apache-2-yellow.svg)
![Swift3](https://img.shields.io/badge/swift-3-blue.svg)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![tuxOS](https://img.shields.io/badge/os-tuxOS-green.svg?style=flat)

**mod_swift** allows you to write native modules
for the
[Apache Web Server](https://httpd.apache.org)
in the 
[Swift 3](http://swift.org/)
programming language.
**Server Side Swift the [right](http://www.alwaysrightinstitute.com/) way**.

Checkout the [mod_swift](http://mod-swift.org/) for more information.

This repository provides a Homebrew tap (repository) from which you can
easily install mod_swift.

## Installation

More detailed instructions can be found in the
[mod_swift documentation](http://docs.mod-swift.org/install/).

### Install on macOS using Homebrew

Got no Homebrew? [Get it!](https://brew.sh)

Before you install mod_swift, we highly recommend that you install or reinstall
the Homebrew Apache w/ HTTP/2 and the MPM event module:

    brew reinstall httpd --with-mpm-event --with-http2

You can also add `--with-privileged-ports` if you want to use such.

Then add the mod_swift tap and install mod_swift:

    brew tap modswift/mod_swift
    brew install mod_swift

*(yes, the account is just modswift w/o underscore due to GitHub limitations)*

## Check whether the installation is OK:

You can call `swift apache validate` to make sure the installation is OK:

    $ swift apache validate
    The Swift Apache build environment looks sound.
    
    srcroot:   /Users/helge/dev/Swift/Apex3
    module:    mods_Apex3
    config:    debug
    product:   /Users/helge/dev/Swift/Apex3/.build/mods_Apex3.so
    apxs:      /usr/local/bin/apxs
    mod_swift: /usr/local
    swift:     3.1.0
    cert:      self-signed-mod_swift-localhost-server.crt
    http/2:    yes

# More Information

Checkout our website: [mod-swift.org](http://mod-swift.org/).

### Who

**mod_swift** is brought to you by
[ZeeZide](http://zeezide.de).
We like feedback, GitHub stars, cool contract work,
presumably any form of praise you can think of.

There is a `#mod_swift` channel on the [Noze.io Slack](http://slack.noze.io)
if you have any questions.

