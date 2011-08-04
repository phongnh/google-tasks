module GoogleTasks
  class Service
    attr_accessor :access_token, :refresh_token

    def self.client_id
      @@client_id
    end

    def self.client_secret
      @@client_secret
    end

    def self.client_id=(new_value)
      @@client_id = new_value
    end

    def self.client_secret=(new_value)
      @@client_secret = new_value
    end

    def self.redirect_uri
      @@redirect_uri
    end

    def initialize(options)
      @access_token  = options[:access_token]
      @refresh_token = options[:refresh_token]
    end

    def refresh
      options = {
        :client_id     => self.class.client_id,
        :client_secret => self.class.client_secret,
        :refresh_token => refresh_token,
        :grant_type    => "refresh_token"
      }

      response = JSON.parse RestClient.post(EXCHANGE_TOKEN_URL, options)

      self.access_token = response["access_token"]
      response
    end

    def self.exchange(code)
      options = {
        :client_id     => client_id,
        :client_secret => client_secret,
        :code          => code,
        :redirect_uri  => redirect_uri,
        :grant_type    => "authorization_code"
      }
      response = JSON.parse RestClient.post(EXCHANGE_TOKEN_URL, options)
      new(:access_token => response["access_token"], :refresh_token => response["refresh_token"])
    end

    def self.authorization_url(scope=SCOPE)
      url = "#{OAUTH_URL}?"
      url << [
        "client_id=#{client_id}",
        "redirect_uri=#{redirect_uri}",
        "scope=#{scope}",
        "response_type=code"
      ].join("&")
      url
    end

    def self.load_config(yaml_file)
      config             = YAML.load_file(yaml_file)
      self.client_id     = config["client_id"]
      self.client_secret = config["client_secret"]
      self.redirect_uri  = config["redirect_uri"]
      config
    end
  end
end

