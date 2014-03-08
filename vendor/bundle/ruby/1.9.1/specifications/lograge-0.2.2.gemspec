# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "lograge"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mathias Meyer"]
  s.date = "2013-09-17"
  s.description = "Tame Rails' multi-line logging into a single line per request"
  s.email = ["meyer@paperplanes.de"]
  s.homepage = "https://github.com/roidrage/lograge"
  s.require_paths = ["lib"]
  s.rubyforge_project = "lograge"
  s.rubygems_version = "1.8.23"
  s.summary = "Tame Rails' multi-line logging into a single line per request"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3"])
      s.add_runtime_dependency(%q<railties>, [">= 3"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 3"])
      s.add_dependency(%q<actionpack>, [">= 3"])
      s.add_dependency(%q<railties>, [">= 3"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 3"])
    s.add_dependency(%q<actionpack>, [">= 3"])
    s.add_dependency(%q<railties>, [">= 3"])
  end
end
