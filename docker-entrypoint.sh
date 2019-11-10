#!/bin/sh
 
# Install Embulk Plugins
if [ -n "$PLUGINS" ] ; then
  ~/.embulk/bin/embulk gem install $PLUGINS
fi
 
~/.embulk/bin/embulk "$@"
