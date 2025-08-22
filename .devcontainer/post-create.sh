#
# after our initial creation of the devcontainer, we will...
#


# mark workspace dir as safe dir for git (b/c container user != host user)
git config --global --add safe.directory /workspaces/iris-web

sudo apt update
sudo apt -y install build-essential libssl-dev libffi-dev python3-dev npm

python3.10 -m venv .venv
source .venv/bin/activate

# change working dir to source 
cd /workspaces/iris-web/source

# install python dependencies
pip install -r requirements.txt

sudo chown -R vscode /home/vscode/iris_data/

nvm install 20
nvm use 20
cd /workspaces/iris-web/ui/
npm ci
npm run build
cp -r  dist/* /workspaces/iris-web/source/static
cp -r /workspaces/iris-web/source/static /workspaces/iris-web/static