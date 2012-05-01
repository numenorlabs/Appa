Appa
====
Get your project off the ground.

    $ cd my_project


## Git

Use git to version your project source code (and other assets) and manage your coding workflow.

Is this project a git repository?

    $ git status

If not, make this project a git repo with an empty root commit.

    $ git init
    $ git commit --allow-empty -m 'root commit'

Copy the gitignore file from this repo to .gitignore into your project.  Edit as neccessary.


## Rvm

Use RVM to manage Ruby and gems on a per project basis.

Is RVM installed?

    $ type rvm | head -1  # should output "rvm is a function"
    $ rvm --version

If not, see installation instructions at <http://beginrescueend.com>.

Check to see what Ruby versions have been installed and what versions are available.

    $ rvm list
    $ rvm list known

List gemsets

    $ rvm gemset list

Create a gemset for this project

    $ rvm --rvmrc --create {ruby-version}@{project-name}
    $ rvm --rvmrc --create 1.9.2@appa  # for example


## Bundler

Use Bundler to manage gems, gem versions and gem dependencies.

Bundler is best installed in the global gemset.

    $ rvm gemset use global
    $ gem install bundler

Create the Gemfile

    $ bundle init


## Rake

Use Rake to manage scripts related to your project.

Copy the Rakefile from this repo into your project.

Rake will execute the default task when invoked without an argument.  One frequent candidate for the default task is to
run the test suite.  Another option is to list out available tasks, as shown below.

*in Rakefile*

    task :default do
      Rake.application.options.show_task_pattern = //
      Rake.application.display_tasks_and_comments()
    end


#### Yipyip!
