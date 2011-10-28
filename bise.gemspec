# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bise/version"

Gem::Specification.new do |s|
  s.name        = "bise"
  s.version     = Bise::VERSION
  s.authors     = ["Eugene Kalenkovich"]
  s.email       = ["rubify@softover.com"]
  s.homepage    = ""
  s.summary     = %q{Binary search in text files}
  s.description = %q{Binary search in ordered text files}

  s.rubyforge_project = "bise"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
