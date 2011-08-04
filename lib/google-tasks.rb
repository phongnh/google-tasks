require "rubygems"
require "google-tasks/service"
require "google-tasks/task_list"
require "google-tasks/task"

module GoogleTasks
	BASE_URL    = "https://www.googleapis.com/tasks"
	API_VERSION = "v1"
	BASE_URI    = "#{BASE_URI}/#{API_VERSION}"
	ME          = "@me"
end
