Rake::Task["assets:precompile"].enhance do
  # from http://stackoverflow.com/questions/7732985/clear-memcached-on-heroku-deploy
  #
  # How to invoke a task that exists elsewhere
  # Rake::Task["assets:environment"].invoke if Rake::Task.task_defined?("assets:environment")

  # Clear cache on deploy
  print "Clearing the rails memcached cache\n"
  Rails.cache.clear
end
