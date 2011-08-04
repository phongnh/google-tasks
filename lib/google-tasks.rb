path = File.dirname(__FILE__)
require "rubygems"
require "yaml"
require "json"
require "rest-client"
require "#{path}/google_tasks/service"
require "#{path}/google_tasks/task_list"
require "#{path}/google_tasks/task"

module GoogleTasks
	BASE_URL           = "https://www.googleapis.com/tasks"
	API_VERSION        = "v1"
	BASE_URI           = "#{BASE_URL}/#{API_VERSION}"
	ME                 = "@me"
	SCOPE              = "https://www.googleapis.com/auth/tasks"
	SCOPE_READONLY     = "#{SCOPE}.readonly"
	BASE_OAUTH_URL     = "https://accounts.google.com/o/oauth2"
	OAUTH_URL          = "#{BASE_OAUTH_URL}/auth"
	EXCHANGE_TOKEN_URL = "#{BASE_OAUTH_URL}/token"
end
