def path_to_workstation_file(filename)
  File.join(File.dirname(__FILE__), "workstation/#{filename}")
end

def system_or_exit(command)
  puts "Executing #{command}"
  system(command) or raise ">>>>>>> Command failed"
end

def workstation(action)
  action = 'status' unless action
  operations = []

  unless File.file?(File.expand_path('~/.gitignore_global'))
    if action == 'install'
      operations << lambda {
        puts 'Installing ~/.gitignore_global'
        system_or_exit "cp #{path_to_workstation_file('gitignore_global')} ~/.gitignore_global"
      }
    else
      operations << lambda {
        puts 'Global gitignore not found.'
      }
    end
  end

  unless File.directory? '/Applications/Divvy.app'
    operations << lambda {
      puts 'Divvy application not found.'
    }
  end

  unless File.file?(File.expand_path('~/Library/Preferences/com.mizage.divvy.plist'))
    if action == 'install'
      operations << lambda {
        puts 'Installing Divvy preferences'
      }
    else
      operations << lambda {
        puts 'Divvy preferences not found.'
      }
    end
  end

  if operations.count > 0
      operations.each do |operation|
        operation.call
      end
  else
    puts 'Your setup is up to date.'
  end
end
