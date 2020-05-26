require_relative 'lib/rickandmorty/version'

Gem::Specification.new do |spec|
  spec.name          = "rickandmorty"
  spec.version       = Rickandmorty::VERSION
  spec.authors       = ["leobr"]
  spec.email         = ["leobrionesherrera@gmail.com"]

  spec.summary       = "This is a gem to help you find information on the TV show Rick and Morty"
  spec.description   = "This is a gem to help you find information on the TV show Rick and Morty"
  spec.homepage      = "https://github.com/Leonzon95/rickandmorty"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/Leonzon95/rickandmorty"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Leonzon95/rickandmorty"
  spec.metadata["changelog_uri"] = "https://github.com/Leonzon95/rickandmorty"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
