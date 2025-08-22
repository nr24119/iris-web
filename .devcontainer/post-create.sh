#
# after our initial creation of the devcontainer, we will...
#

# mark workspace dir as safe dir for git (b/c container user != host user)
git config --global --add safe.directory /workspaces/iris-web

# change working dir to source 
cd source

sudo apt update
sudo apt install sudo apt-get install build-essential libssl-dev libffi-dev python3-dev

# install python dependencies
pip install -r requirements.txt

sudo chown -R vscode /home/vscode/iris_data/