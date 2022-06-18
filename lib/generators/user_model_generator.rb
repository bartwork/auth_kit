# frozen_string_literal: true

class UserModelGenerator < Rails::Generators::Base
  desc 'This generator creates model User at models/user.rb'
  def create_initializer_file
    create_file 'models/user.rb', '# Add user model'
  end
end
