# disable clientbuckets globally - we do not want to keep copies of files that
# puppet overwrites
File { backup => false }
