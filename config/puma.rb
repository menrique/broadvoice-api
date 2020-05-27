# Puma config
workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['THREAD_COUNT'] || 4)
threads threads_count, threads_count

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'