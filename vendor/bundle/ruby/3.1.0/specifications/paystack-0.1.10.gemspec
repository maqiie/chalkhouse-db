# -*- encoding: utf-8 -*-
# stub: paystack 0.1.10 ruby lib

Gem::Specification.new do |s|
  s.name = "paystack".freeze
  s.version = "0.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Victor Ikoro".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-04-05"
  s.description = "Client Library Gem for PayStack.co".freeze
  s.email = ["ikoro.victor@gmail.com".freeze]
  s.homepage = "https://github.com/IkoroVictor/paystack-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "PayStack.co gem for Ruby/Rails".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.2"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0"])
end
