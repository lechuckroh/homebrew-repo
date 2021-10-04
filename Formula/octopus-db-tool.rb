class OctopusDbTool < Formula
    desc "DB schema tools with format conversion, source generation, reverse/forward engineering"
    homepage "https://github.com/lechuckroh/octopus-db-tool"
    version "2.0.0"
    license "MIT"
    bottle :unneeded
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/lechuckroh/octopus-db-tool/releases/download/v2.0.0/oct-darwin-amd64-v2.0.0.zip", :using => CurlDownloadStrategy
        sha256 "6ffd8d364dff46c264536df64751147b201efeb827efe66efcbeb71bc9541952"
      end
      if Hardware::CPU.arm?
        url "https://github.com/lechuckroh/octopus-db-tool/releases/download/v2.0.0/oct-darwin-arm64-v2.0.0.zip", :using => CurlDownloadStrategy
        sha256 "ff79e99b060bb30576d640956c38145946410825bedf25e35fd63f7fb2b56589"
      end
    end
  
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/lechuckroh/octopus-db-tool/releases/download/v2.0.0/oct-linux-amd64-v2.0.0.zip", :using => CurlDownloadStrategy
        sha256 "a9afd05dab3490afd9e275fccdc82316575957687fadee6e554157c327df9c71"
      end
      if Hardware::CPU.arm?
        url "https://github.com/lechuckroh/octopus-db-tool/releases/download/v2.0.0/oct-linux-arm64-v2.0.0.zip", :using => CurlDownloadStrategy
        sha256 "d810a03b1f6a2709757d613f52509a6f85951b790e8aa115f20de2469c069010"
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
  