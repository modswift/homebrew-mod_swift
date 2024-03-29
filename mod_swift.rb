class ModSwift < Formula
  class CLTRequirement < Requirement
    fatal true
    satisfy { MacOS.version < :mavericks || MacOS::CLT.installed? }

    def message; <<-EOS.undent
      Xcode Command Line Tools required, even if Xcode is installed, on OS X 10.9 or
      10.10 and not using Homebrew httpd. Resolve by running
        xcode-select --install
      EOS
    end
  end

  desc "Write Apache Modules in Swift!"
  homepage "http://mod-swift.org"
  url "https://github.com/modswift/mod_swift/archive/0.9.1.tar.gz"
  # curl -L https://github.com/modswift/mod_swift/archive/0.9.1.tar.gz | shasum -a 256
  sha256 "7f9e630cf86748268c817a49502c1f9301a2181e0f1099e151d58d178307d02b"
  
  option "with-system-httpd",   "Use macOS system Apache httpd 2.4"
  option "with-homebrew-httpd", "Use Homebrew Apache httpd" # noop
  
  # TBD: can we recommend => [ "with-http2", "with-mpm-event" ] w/o
  #      a hard require?
  depends_on "xmlstarlet"
  depends_on "jq"
  depends_on "pkg-config"
  depends_on "httpd"        if build.without?("system-httpd")
  depends_on CLTRequirement if build.with?("system-httpd")
  
  if build.with?("with-system-httpd") && build.with?("homebrew-httpd")
    onoe "Cannot build for system httpd and brew httpd at the same time"
    exit 1
  end

  def apache_apxs
    if build.without? "system-httpd"
      %W[sbin bin].each do |dir|
        if File.exist?(location = "#{Formula["httpd"].opt_prefix}/#{dir}/apxs")
          return location
        end
      end
    else
      "/usr/sbin/apxs"
    end
  end

  def apache_configdir
    if build.without? "system-httpd"
      "#{etc}/apache2/2.4"
    else
      "/etc/apache2"
    end
  end

  def install
    args = %W[--prefix=#{prefix} --with-apxs=#{apache_apxs}]
    system "./configure", *args
    system "make", "all"
    system "make", "install"
  end

  def caveats; <<~EOS
    You must manually edit #{apache_configdir}/httpd.conf to include
      LoadModule swift_module #{libexec}/mod_swift.so

    NOTE: If you're using --with-system-httpd and having
    installation problems relating to a missing `cc` compiler and `OSX#{MacOS.version}.xctoolchain`,
    read the "Troubleshooting" section of https://github.com/Homebrew/homebrew-apache
    EOS
  end
end
