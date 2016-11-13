irb = proc do |env|
  ENV['RACK_ENV'] = env
  trap('INT', "IGNORE")
  sh "#{FileUtils::RUBY.sub('ruby', 'irb')} -r #{PROJ_ROOT}/models"
end

desc "Open irb shell in test mode"
task :test_irb do
  irb.call('test')
end

desc "Open irb shell in development mode"
task :dev_irb do
  irb.call('development')
end

desc "Open irb shell in production mode"
task :prod_irb do
  irb.call('production')
end
