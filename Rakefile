task default: "rynotes:build"

namespace :rynotes do
  desc "Build rynotes"
  task :build do
    sh "hugo -t angels-ladder"
  end

  desc "Build rynotes and upload _site directory to S3"
  task :deploy do
    Rake::Task["rynotes:build"].invoke
    sh "bundle exec s3_website push"
  end
end
