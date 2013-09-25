# Franchise 

Franchise is a "framework" for managing debian based chef-solo installs. After pasting around various bits from different projects, I extracted them into a common generator, allowing you to create franchises easily.

### Dependencies
* gem install berksfile (ruby 1.9 only)
* pip install fabric
* debian based host

### How it works
Here's a high level view of the execution model:

1. [Berkshelf](http://berkshelf.com/) is run against a ```Berksfile```, copying all cookbooks and their dependencies to the ```vendor/cookbooks``` directory. If any custom cookbooks are specified, they are also copied from ```cookbooks/```. 
2. [Fabric](http://fabfile.org) is run against a target host, along with the username and password (if needed).
3. If this is the first time fabric runs, it will "bootstrap" the host, installing chef-solo and other support tools.
4. Once bootstrapped, your cookbooks and roles are uploaded to the host.
5. Chef-solo is run against your runlist, which runs through your cookbooks.

For more detail, view the [fabfile.py.template]()

### Installation

Clone the project:

    git clone git@github.com:capotej/franchise.git ~/.franchise_sub

For bash users:

    echo 'eval "$($HOME/.base_sub/bin/base init -)"' >> ~/.bash_profile
    exec bash

For zsh users:

    echo 'eval "$($HOME/.base_sub/bin/base init -)"' >> ~/.zshenv
    source ~/.zshenv

### Generating an franchise
