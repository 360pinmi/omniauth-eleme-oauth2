# coding: utf-8

version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.name          = "omniauth-eleme-oauth2"
  spec.version       = version
  spec.authors       = ["neil"]
  spec.email         = ["wanxsb@gmail.com"]

  spec.summary       = "omniauth strategy for eleme "
  spec.description   = "饿了么商家平台 OAuth2.0 对接开发"
  spec.homepage      = "git@github.com:360pinmi/omniauth-eleme-oauth2.git"

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.requirements  << 'none'

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
  spec.add_development_dependency "rspec", "~> 3.0"
end
