Run filebot from cli with Docker
================

### Purpose
Allows you to run filebot using a volume share and let it rename files.
Filebot (http://www.filebot.net/)

### Running
To run filebot, fire up docker like so:

	$ sudo docker run -i -t -v /path/to/files:/files -v /path/to/local/cache:/home/docker --rm=true -u="1000" jedimonkey/filebot-cli filebot [options]

It's designed to run batch or interactively.  The docker will remove it's active container once the running process has finished.
This runs as a unprivileged user (1000), which you can map to your local user id as needed.