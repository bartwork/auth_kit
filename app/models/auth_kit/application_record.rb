# frozen_string_literal: true

module AuthKit
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
