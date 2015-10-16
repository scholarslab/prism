# config valid only for current version of Capistrano
lock '3.4.0'

set :application, "prism"
set :repo_url,  "git://github.com/scholarslab/prism.git"

set :deploy_to, "/usr/local/projects/#{fetch(:application)}"

set :ssh_options, keys: ["config/deploy_id_rsa"] if File.exist?("config/deploy_id_rsa")

# Default value for :scm is :git
# set :scm, :git

# Default branch is :master
#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

before "deploy", "deploy:assets:precompile"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

#set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
#set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :migration_role, 'migrator'
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Default value for keep_releases is 5
set :keep_releases, 3
#set :rvm_map_bins, fetch(:rvm_map_bins, []).push('rvmsudo')
#set :passenger_restart_command, '/usr/local/rvm/gems/ruby-2.1.4/bin/passenger-config restart-app'
#set :passenger_restart_command, 'sudo passenger-config restart-app'
set :passenger_restart_with_sudo, true

set :tmp_dir, "/tmp/#{ENV['USER']}"

namespace :deploy do

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
