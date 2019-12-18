Gem::Specification.new do |spec|
  spec.name = "rack-builtwith"
  spec.version = "1.0.0.alpha"
  spec.author = "Samuel Cochran"
  spec.email = "sj26@sj26.com"

  spec.summary = %q{Remove your site from builtwith.com}
  spec.homepage = "https://github.com/sj26/rack-builtwith"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sj26/rack-builtwith"

  spec.files = Dir["README.md", "LICENSE", "lib/**/*"]

  spec.add_dependency "rack"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
