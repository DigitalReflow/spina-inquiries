require "test_helper"
require "generators/migrations/migrations_generator"

module Spina
  class MigrationsGeneratorTest < Rails::Generators::TestCase
    tests MigrationsGenerator
    destination Rails.root.join("tmp/generators")
    setup :prepare_destination
  end
end
