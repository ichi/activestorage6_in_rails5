require "activestorage6_in_rails5/version"

module Activestorage6InRails5
  # Your code goes here...
end

require_relative 'monkey_patches/activerecord/reflection.rb'
require_relative 'core_ext/securerandom.rb'

require "active_storage/engine"

module ActiveStorage
  autoload :Downloader
end
