class OctopusDbTool < Formula
    desc "DB schema tools with format conversion, source generation, reverse/forward engineering"
    homepage "https://github.com/lechuckroh/octopus-db-tool"
    version "2.0.0-beta3"
    license "MIT"
    bottle :unneeded
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/lechuckroh/octopus-db-tool/releases/download/2.0.0-beta3/oct-darwin64.gz", :using => CurlDownloadStrategy
        sha256 "938d026d6fa9f0f78593d4edea0779c8563f85a1d9292b740176a140fc168965"
      end
      if Hardware::CPU.arm?
        url "https://github.com/lechuckroh/octopus-db-tool/releases/download/2.0.0-beta3/oct-darwin64.gz", :using => CurlDownloadStrategy
        sha256 "938d026d6fa9f0f78593d4edea0779c8563f85a1d9292b740176a140fc168965"
      end
    end
  
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/lechuckroh/octopus-db-tool/releases/download/2.0.0-beta3/oct-linux64.gz", :using => CurlDownloadStrategy
        sha256 "a8f408f31f4e24888bfdd466ac51a1a9e7167608c16a69df308085176d711117"
      end
    end
  
    head "https://github.com/lechuckroh/octopus-db-tool.git", :branch => "master"
  
    depends_on "go" => :build
  
    def install
      if !File.exists? "oct"
        system "make vendor && make compile"
      end
      bin.install "oct"
    end
  
    test do
      system "#{bin}/oct --version"
    end
  end
  