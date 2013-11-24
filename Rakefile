task :default do
  system 'rake -T'
end

desc 'Pull changes from origin master'
task :pull do
  system_do 'git pull --rebase origin master'
end

desc 'Run all specs'
task :specs do
  # TBI
end

desc 'Push changes to origin master'
task :push do
  system_do 'git push origin master'
end

desc 'Integrate local changes'
task :integrate => [:pull, :specs, :push]


#
#  Helper functions
#

def system_do(command)
  puts "$ #{command}"
  system(command) or raise '>>>>>>> Command failed'
end
