require 'find'

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

  with_application 'Divvy', operations

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

  with_application 'Dropbox', operations

  with_application 'Flux', operations

  unless File.exists? '/Applications/Screen Sharing.app'
    if action == 'install'
      operations << lambda {
        puts 'Installing Screen Sharing application.'
        system_or_exit "ln -s '/System/Library/CoreServices/Screen Sharing.app' /Applications/"
      }
    else
      operations << lambda {
        puts 'Screen Sharing application not found.'
      }
    end
  end

  with_application 'Numbers', operations

  unless `git config core.editor`.start_with? 'emacs'
    if action == 'install'
      operations << lambda {
        puts 'Setting git editor'
        system_or_exit 'git config --global core.editor "emacs"'
      }
    else
      operations << lambda {
        puts 'git editor not set to emacs'
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

def with_application(application_name, operations)
  application_found = false
  Find.find '/Applications/' do |path|
    application_found = true if path =~ /#{application_name}\.app$/
    Find.prune if path =~ /\.app$/
  end
  if !application_found
    operations << lambda {
      puts "#{application_name} application not found."
    }
  end
end
