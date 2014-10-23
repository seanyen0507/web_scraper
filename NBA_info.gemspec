$:.push File.expand_path("../lib", __FILE__)
require 'NBA_info/version'

Gem::Specification.new do |s|
  s.name        =  'NBA_info'
  s.version     =  NBA_INFO::VERSION
  s.executables << 'application.rb'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.date        =  '2014-10-23'
  s.summary     =  'NBA information extractor and analyzer'
  s.description =  'Extract and analyze NBA information from Yahoo sport and ESPN.com'
  s.authors     =  ['poweihuang', 'hsuchinwang', 'seanyean0507']
  s.email       =  'benny59438@gmail.com'
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    =  'https://github.com/seanyen0507/web_scraper'
  s.license     =  'MIT'
end
