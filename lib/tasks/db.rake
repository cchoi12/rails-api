def do_task(name)
  puts '#' * 80
  puts "## #{name}"
  puts '#' * 80
  Rake::Task[name].invoke
  puts
end

namespace :db do
  desc 'Remigrate (aka. `db:{drop,create,migrate,seed}`)'
  task remigrate: [:environment] do
    do_task('db:drop')
    do_task('db:create')
    do_task('db:migrate')
    # ActiveRecord::Base.connection.schema_cache.clear!
    ActiveRecord::Base.descendants.each(&:reset_column_information) rescue Mysql2::Error
    do_task('db:seed')
    puts '#' * 80
    puts '## geocoding'
    Doctor.find_each { |m| m.geocode && m.save! && sleep(0.25) }
  end
end
