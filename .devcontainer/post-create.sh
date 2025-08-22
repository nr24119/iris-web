#
# after our initial creation of the devcontainer, we will...
#


# mark workspace dir as safe dir for git (b/c container user != host user)
git config --global --add safe.directory /workspaces/iris-web

sudo apt update
sudo apt -y install build-essential libssl-dev libffi-dev python3-dev npm

cd ui/
sh -c "npm install && NODE_OPTIONS="--inspect" npm run dev -- --host"
cp -r  /ui/dist /workspaces/iris-web/static

python3.10 -m venv .venv
source .venv/bin/activate

# change working dir to source 
cd /workspaces/iris-web/source



# install python dependencies
pip install -r requirements.txt

sudo chown -R vscode /home/vscode/iris_data/