application = "curry"

listen "/tmp/unicorn_#{application}.sock"
pid "/tmp/unicorn_#{application}.pid"

worker_processes 2
timeout 30
preload_app true

if ENV['RAILS_ENV'] == 'production'
  shared_path = "/var/www/#{application}/shared"
  stderr_path = "#{shared_path}/log/unicorn.stderr.log"
  stdout_path = "#{shared_path}/log/unicorn.stdout.log"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
