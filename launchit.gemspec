# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "launchit/version"

Gem::Specification.new do |s|
  s.name        = "launchit"
  s.version     = Launchit::VERSION
  s.authors     = ["Łukasz Korecki"]
  s.email       = ["lukasz@coffeesounds.com"]
  s.homepage    = ""
  s.summary     = %q{Easily launch Mac applications from your terminal}
  s.description = %q{Kinda like Quicksilver but from terminal}

  s.rubyforge_project = "launchit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
