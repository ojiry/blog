# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'blog'

# set :repo_url, 'git@github.com:ojiry/blog.git'
set :repo_url, 'https://github.com/ojiry/blog.git'

# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

namespace :deploy do

  after 'symlink:release', :build do
    on roles(:app) do
      within current_path do
        execute :jekyll, 'build'
      end
    end
  end

end
