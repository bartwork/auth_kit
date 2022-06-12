# frozen_string_literal: true

require_relative 'lib/auth_kit/version'

Gem::Specification.new do |spec|
  spec.name        = 'auth_kit'
  spec.version     = AuthKit::VERSION
  spec.authors     = ['Alexander Bartenev']
  spec.email       = ['bartworkmail@gmail.com']
  spec.homepage    = 'https://github.com/bartwork/auth_kit'
  spec.summary     = 'AuthKit for RubyOnRails'
  spec.description = 'AuthKit for RubyOnRails'
  spec.license     = 'MIT'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/bartwork/auth_kit'
  spec.metadata['changelog_uri'] = 'https://github.com/bartwork/auth_kit'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'bcrypt'
  spec.add_dependency 'rails', '>= 7.0.3'
  spec.add_development_dependency 'debug'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rspec-rails'
end
