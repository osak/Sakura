namespace :secrets do
  desc "Upload config/secrets.yml"
  path = "config/secrets.yml"
  task :upload do
    on roles(:app) do
      upload!(path, shared_path.join(path))
    end
  end
end
