import subprocess
from datetime import datetime

def get_media_svn_revision(absolute_path):
    repo_dir = absolute_path
    svn_revision = subprocess.Popen(
        "svn info | grep 'Revision' | awk '{print $2}'",
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE, 
        shell=True,
        cwd=repo_dir,
        universal_newlines=True)
    rev = svn_revision.communicate()[0].partition('\n')[0]
    return rev

def get_git_changeset(absolute_path):
    repo_dir = absolute_path
    git_show = subprocess.Popen(
        "git show --pretty=format:%ct --quiet HEAD",
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        shell=True,
        cwd=repo_dir,
        universal_newlines=True)
    timestamp = git_show.communicate()[0].partition(‘\n’)[0]
    try:
        timestamp = datetime.utcfromtimestamp(int(timestamp))
    except ValueError:
        return ""
    changeset = timestamp.strftime(‘%Y%m%d%H%M%S’)
    return changeset
