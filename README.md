Run filebot from cli with Docker
================

### Purpose
Allows you to run filebot using a volume share and let it rename files.
Filebot (http://www.filebot.net/)

### Running
To run filebot, file up docker like so:

	$ sudo docker run -i --name=filebot -t -v /share:/share -v /path/to/local/cache:/home/docker --rm=true -u="1000" marcus/filebot:v4

It's designed to run batch or interactively.  The docker will remove it's active container (hence why it's also named, although that can easily be removed) once the running process has finished.

