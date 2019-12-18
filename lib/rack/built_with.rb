require "rack"
require "base64"

class Rack::BuiltWith
  class Error < StandardError; end

  def initialize(app, host=nil)
    @app = app
    @host = host
  end

  def call(env)
    request = Rack::Request.new(env)

    if request.get? && request.path == "/builtwith.txt"
      host = @host || request.host
      body = Base64.encode64(host).chomp

      [200, {"Content-Type" => "text/plain", "Content-Length" => body.bytesize}, [body]]
    else
      @app.call(env)
    end
  end
end
