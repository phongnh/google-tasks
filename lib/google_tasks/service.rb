module GoogleTasks
	class Service
		
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

		def initialize()
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

		def self.exchange_token_url(code)
			url = "#{EXCHANGE_TOKEN_URL}"
			options = {
				:client_id     => client_id,
				:client_secret => client_secret,
				:code          => code,
				:redirect_uri  => redirect_uri,
				:grant_type    => "authorization_code"
			}
			[url, options]
		end

		def self.load_config(yaml_file)
			config = YAML.load_file(yaml_file)
			self.client_id = config["client_id"]
			self.client_secret = config["client_secret"]
			@@redirect_uri = config["redirect_uri"]
			nil
		end
	end
end

