require "log"
require "json"
require "./d1/configuration"
require "./d1/types"
require "./d1/response"
require "./d1/api"
require "./d1/database"

# API for Cloudflare D1 databases.
module D1
  VERSION = "0.1.0"
  Log     = ::Log.for("d1")

  class ResponseError < Exception
    getter info : Array(Response::ResponseInfo)

    def initialize(@info)
      if info.empty?
        @message = "Unknown Response Error."
      else
        @message = "Error #{info.first.code}: #{info.first.message}."
      end
    end
  end
end
