require 'base64'
require 'sequel'
require 'require_all'
require 'net/http'
require 'json'

DB = Sequel.connect(
  adapter: 'mysql2',
  host: ENV.fetch('DB_HOSTNAME'),
  database: ENV.fetch('DB_NAME'),
  user: ENV.fetch('DB_USER'),
  password: ENV.fetch('DB_PASS'),
  read_timeout: 9999
)

module Common;
end

module PerformancePlatform
  module Gateway; end
  module Repository; end
  module UseCase; end
  module Presenter; end
end

require_all 'lib'