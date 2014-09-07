namespace :db do
  desc "Upload config/database.yml"
  path = "config/database.yml"
  task :upload do
    on roles(:db) do
      upload!(path, shared_path.join(path))
    end
  end
end
