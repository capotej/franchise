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

For more detail, view the [fabfile.py.template](https://github.com/capotej/franchise/blob/master/share/franchise/fabfile.py.template)

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

Once installed, usage is very simple:

    franchise new ircbox 

This will create a franchise ```ircbox/``` in the current directory.

### Running it

    cd ircbox
    fab --user=root --password=hihaters chef:hosts=11.22.33.44

This will bootstrap the host and install the "ntp" recipe from opscode into 11.22.33.44

### Specifying cookbooks

If the cookbook you want is an [Opscode Community Cookbooks](http://community.opscode.com/cookbooks), you can just specify it in the Berksfile. See the [Berkshelf](http://berkshelf.com) website for more information on specifying dependencies via git or http.

### Customizing cookbooks

Sometimes the cookbook you want to install isnt available or doesn't exist. In this case, just drop your cookbook into the ```cookbooks```directory and specify it in the Berksfile as such:

    cookbook "runit", path: "cookbooks/runit"




