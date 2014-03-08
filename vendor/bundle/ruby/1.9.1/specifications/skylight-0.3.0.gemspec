# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "skylight"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tilde, Inc."]
  s.date = "2014-02-28"
  s.email = ["engineering@tilde.io"]
  s.executables = ["skylight"]
  s.extensions = ["ext/extconf.rb"]
  s.files = ["bin/skylight", "ext/extconf.rb"]
  s.homepage = "http://www.skylight.io"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "1.8.23"
  s.summary = "Skylight is a ruby application monitoring tool. Currently in closed beta."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
  end
end
