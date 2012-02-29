Appa
====
Get your project off the ground.

    $ cd my_project


## Git

Is this project a git repository?

    $ git status

If not, make this project a git repo.

    $ git init


## Rvm

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

Bundler is best installed in the global gemset.

    $ rvm gemset use global
    $ gem install bundler

Create the Gemfile

    $ bundler init

#### Yipyip!
