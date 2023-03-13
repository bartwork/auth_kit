# frozen_string_literal: true

module AuthKit
  class ApplicationController < ::ApplicationController

    before_action :current_user

    def current_user

    end

    private

    def find_user

    end

  end
end
