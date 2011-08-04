require "rubygems"
require "google_tasks/service"
require "google_tasks/task_list"
require "google_tasks/task"

module GoogleTasks
	BASE_URL    = "https://www.googleapis.com/tasks"
	API_VERSION = "v1"
	BASE_URI    = "#{BASE_URL}/#{API_VERSION}"
	ME          = "@me"
end
