# setup-automation
A repository containing automation scripts for the setup of my development environment.

## no_admin.sh
`no_admin.sh` encompasses development environment setup on a workstation or instance without admin priviledges. The bash script assumes that Anaconda Python is already installed, or can be imported as a module.

Environment variable definitions:\
`$MACHINETITLE`: The name of the virtual machine you want to associate with the corresponding SSH key.\
`$GITUSER`: Your Github username.\
`$GITPASS`: Your Github password.
