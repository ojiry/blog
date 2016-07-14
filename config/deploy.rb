# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'rynotes'

# set :repo_url, 'git@github.com:ojiry/rynotes.git'
set :repo_url, 'https://github.com/ojiry/rynotes.git'

# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :rbenv_type, :user
set :rbenv_ruby, '2.4.0-dev'

namespace :deploy do

  after 'symlink:release', :build do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, :jekyll, 'build'
      end
    end
  end

end
