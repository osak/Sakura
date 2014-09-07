worker_processes 2

app_path = File.expand_path("../..", __FILE__)
working_directory "#{app_path}/current"
pid "#{app_path}/current/tmp/pids/unicorn.pid"

listen "/tmp/sakura.sock"

stderr_path "log/unicorn.stderr.log"
strout_path "log/unicorn.stdout.log"
