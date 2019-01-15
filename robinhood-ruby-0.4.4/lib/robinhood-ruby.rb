require "net/http"
require "net/https"
require "builder"
require "multi_json"
require "cgi"
require "openssl"
require "base64"
require "forwardable"
require "singleton"
require "httparty"

require "robinhood-ruby/version" unless defined?(Robinhood::VERSION)
require "robinhood-ruby"
require "robinhood-ruby/util"
require "robinhood-ruby/util/configuration"
require "robinhood-ruby/util/request"
require "robinhood-ruby/rest/endpoints"
require "robinhood-ruby/rest/api"
require "robinhood-ruby/rest/client"

module Robinhood
  extend SingleForwardable

  def_delegators :configuration, :username, :password
  
  ##
  # Pre-configure with account SID and auth token so that you don"t need to
  # pass them to various initializers each time.
  def self.configure(&block)
    yield configuration
  end

  ##
  # Returns an existing or instantiates a new configuration object.
  def self.configuration
    @configuration ||= Util::Configuration.new
  end
  private_class_method :configuration
end