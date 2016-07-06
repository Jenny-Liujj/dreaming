# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'dreaming'
set :repo_url, 'https://liu7899@github.com/liu7899/dreaming.git'

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, '/home/www/dreaming'
set :scm, :git

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml','config/settings.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :keep_releases, 15


namespace :deploy do

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

end

namespace :db do
  desc 'Create database if not exist.'
  task :create do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:create'
        end
      end
    end
  end
end
