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
    $ git commit --allow-empty -m 'Root commit'

If your environment creates a template project with an already initialized git repo, you can prepend an empty
root commit like this:

    $ git checkout --orphan new_root
    $ git rm -rf .
    $ git commit --allow-empty -m 'Root commit'
    $ git checkout master
    $ git rebase new_root
    $ git branch -d new_root

You can tell git to ignore files at three levels.

To tell git to ignore certain files in all projects, copy the gitignore_global file from this repo to
~/.gitignore_global.  Edit as necessary.  Then tell git to use it.

    $git config --global core.excludesfile ~/.gitignore_global

To ignore files at the project level, copy the gitignore file from this repo to .gitignore into your project.
Edit as necessary.

You can also specify local per-project excludes in .git/info/exclude.

See also: https://help.github.com/articles/ignoring-files

My favorite git tutorial: http://www-cs-students.stanford.edu/~blynn/gitmagic/


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
      Rake.application.options.show_tasks = :tasks
      Rake.application.options.show_task_pattern = //
      Rake.application.display_tasks_and_comments()
    end


## PostgreSQL

Use PostgreSQL for all of your database needs.

Download and install PostgreSQL from the website: http://www.postgresql.org/download/macosx/ .

Add the Postgres binaries to your shell path by placing the postgres bin path in /etc/paths.d/postgres:

*in /etc/paths.d/postgres*

    /Library/PostgreSQL/9.1/bin

To allow local clients to connect to the database, change authentication for local connections from 'md5' to 'trust':

*in /Library/PostgreSQL/9.1/data/pg_hba.conf*

    # "local" is for Unix domain socket connections only
    local   all         all                               trust
    # IPv4 local connections:
    host    all         all         127.0.0.1/32          trust
    # IPv6 local connections:</code>
    host    all         all         ::1/128               trust


#### Yipyip!
