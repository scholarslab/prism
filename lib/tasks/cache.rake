if Rake::Task.task_defined?("assets:precompile:nondigest")
  Rake::Task["assets:precompile:nondigest"].enhance do
    Rails.cache.clear
  end
else
  Rake::Task["assets:precompile"].enhance do
    # rails 3.1.1 will clear out Rails.application.config if the env vars
    # RAILS_GROUP and RAILS_ENV are not defined. We need to reload the
    # assets environment in this case.
    # Rake::Task["assets:environment"].invoke if Rake::Task.task_defined?("assets:environment")
    Rails.cache.clear
  end
end

#Rake::Task["assets:precompile"].enhance do
  # from http://stackoverflow.com/questions/7732985/clear-memcached-on-heroku-deploy
  #
  # How to invoke a task that exists elsewhere
  # Rake::Task["assets:environment"].invoke if Rake::Task.task_defined?("assets:environment")

  # Clear cache on deploy
#  print "Clearing the rails memcached cache\n"
#  Rails.cache.clear
#end
