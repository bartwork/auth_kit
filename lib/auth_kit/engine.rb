# frozen_string_literal: true

module AuthKit
  class Engine < ::Rails::Engine
    isolate_namespace AuthKit

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
