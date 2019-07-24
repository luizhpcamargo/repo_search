require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RepoSearch
  class Application < Rails::Application
    config.load_defaults 5.2
    config.autoload_paths += ['handlers']
  end
end
