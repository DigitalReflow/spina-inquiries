$:.push File.expand_path("lib", __dir__)

require "spina/inquiries/version"

Gem::Specification.new do |spec|
  spec.name = "spina-inquiries"
  spec.version = Spina::Inquiries::VERSION
  spec.authors = ["Dan Mitchell"]
  spec.email = ["dan@danmitchell.co.uk"]
  spec.homepage = "https://www.danmitchell.co.uk/"
  spec.summary = "Inquiry system for Spina"
  spec.description = "Plugin for Spina CMS to include inquiries on your website"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  spec.test_files = Dir["test/**/*"]

  spec.add_dependency "rails"

  spec.add_development_dependency "spina"
  spec.add_development_dependency "pg"
end
