# coding: utf-8

version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.name          = "omniauth-eleme-oauth2"
  spec.version       = version
  spec.authors       = ["neil"]
  spec.email         = ["wanxsb@gmail.com"]

  spec.summary       = "omniauth strategy for eleme "
  spec.description   = "Using OAuth2 to authenticate ele.me shop user when web resources being viewed"
  spec.homepage      = "http://www.diandanbao.com"

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.requirements  << 'none'

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
  spec.add_development_dependency "rspec", "~> 3.0"
end
