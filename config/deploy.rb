require "bundler/capistrano"

set :application, "prism"
set :repository,  "git://github.com/scholarslab/prism.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "23.21.98.97" # Your HTTP server, Apache/etc
role :app, "23.21.98.97"                          # This may be the same as your `Web` server
role :db,  "23.21.98.97", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

before "deploy", "deploy:assets:precompile"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :deploy_to, "/usr/local/projects/#{application}"
set :deploy_via, :remote_cache
set :user, 'ubuntu'
set :runner, user
set :run_method, :run

ssh_options[:keys] = [File.join(ENV["HOME"], ".ec2", "wsg4w.pem")]

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end
