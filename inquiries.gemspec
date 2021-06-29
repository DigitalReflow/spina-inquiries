$:.push File.expand_path("lib", __dir__)

require "spina/inquiries/version"

Gem::Specification.new do |s|
  s.name = "spina-inquiries"
  s.version = Spina::Inquiries::VERSION
  s.authors = ["Dan Mitchell"]
  s.email = ["dan@danmitchell.co.uk"]
  s.homepage = "https://www.danmitchell.co.uk/"
  s.summary = "Inquiry manager for Spina"
  s.description = "Plugin for Spina CMS to include inquiries on your website"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 6"
  s.add_dependency "pg", "~> 1.2"
  s.add_dependency "spina", ">= 2.0"
  s.add_dependency 'spam_email', '~> 0.1.3'
  s.add_dependency "filters_spam", "~> 0.4"
  s.add_dependency "invisible_captcha", "~> 2.0"

  s.add_development_dependency 'letter_opener', '~> 1.7'
  s.add_development_dependency 'rubocop-govuk', '>= 3.17.2', '~> 4.0'
end
