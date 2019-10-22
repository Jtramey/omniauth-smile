# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/smile/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-smile'
  s.version  = OmniAuth::Smile::VERSION
  s.authors  = ['Jay El-Kaake']
  s.email    = ['dev@feracommerce.com']
  s.summary  = 'Smile strategy for OmniAuth'
  s.homepage = 'https://github.com/feracommerce/omniauth-smile'
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.1.9'

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.5.0'
  s.add_runtime_dependency 'activesupport'

  s.add_development_dependency 'rake'
end
