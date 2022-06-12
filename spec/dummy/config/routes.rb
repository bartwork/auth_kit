Rails.application.routes.draw do
  mount AuthKit::Engine => "/auth_kit"
end
