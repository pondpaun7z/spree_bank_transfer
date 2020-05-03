# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree/bank_tranfer/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree-bank-transfer'
  s.version     = '4.1.0'
  s.summary     = 'Spree extension to create bank transfer payment method.'
  s.description = 'This Spree extension allows admin to provide bank transfer payment method to its users.'

  s.author    = 'Theeraphat Jantakat'
  s.email     = 'pppangpondpp7@gmail.com'
  s.homepage  = 'https://pondpaun.sevenz.info'
  s.license   = "MIT"
  s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version =  '>= 3.1.0', '< 5.0'
  s.add_dependency 'spree_core', spree_version
  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
end
