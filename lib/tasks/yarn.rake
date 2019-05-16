task spec: %w[yarn]

desc 'Installing dependencies with Yarn'
task :yarn do
  sh 'yarn install', verbose: false do |ok, _|
    if ok
      puts '✅ Yarn install ran OK'.green
    else
      puts '⚠️ Failed to run yarn successfully, Is Yarn installed?'.red
      exit(1)
    end
  end
end
