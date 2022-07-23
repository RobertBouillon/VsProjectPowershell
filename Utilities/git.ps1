$original_forked_project="https://github.com/someone/something.git"

# Resets your fork to whatever the current project us
function fork_reset()
{
  git remote add upstream 
  git fetch upstream
  git checkout main
  git reset --hard upstream/main
  git push origin main --force 
}

# Resets updates to the current project into your fork
function fork_pull()
{
  git remote add upstream https://github.com/usspeedskating/tempus.git
  git fetch upstream
  git checkout main
  git merge upstream/main
}

# Pull with submodules. 
function pull()
{
  git pull --recurse-submodules
}

# Switch to another branch and automatically update submodules
function switch($branch)
{
  git switch $branch
  git submodule update
}