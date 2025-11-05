module Cloudflare::D1
  class_getter config = Configuration.new

  # Customize settings using a block.
  #
  # ```
  # Cloudflare::D1.configure do |config|
  #   cibfug.account_id = "023e105f4ecef8ad9ca31a8372d0c353"
  #   config.api_token = "Sn3lZJTBX6kkg7OdcBUAxOO963GEIyGQqnFTOFYY"
  # end
  # ```
  def self.configure(&) : Nil
    yield config
  end

  class Configuration
    property account_id : String = ""
    property api_token : String = ""
  end
end
