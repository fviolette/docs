#!/usr/bin/env sh

# CI publish script

# Stable DITA-OT version
export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION

# Latest DITA-OT version from 'develop' branch
export DITA_OT_DEV=$(find $PWD -name 'dita-ot-*+*' -type d | head -1)

# Site directory for GitHub Pages
export SITE_DIR=$PWD/dita-ot.github.io

#if [ "$TRAVIS_PULL_REQUEST" = "false" -a "$TRAVIS_BRANCH" = "develop" ]; then
  # Remove target output directory before generating new output
  rm -rf "$SITE_DIR/dev"
  # Re-create /dev folder & generate site output there
  ./gradlew -b site.gradle -Ddita.home=$DITA_OT_DEV -Doutput.dir=$SITE_DIR/dev -PditaHomeSrc=$DITA_OT_DEV --info --stacktrace --no-daemon
#else
#  ./gradlew -Ddita.home=$DITA_HOME html --info --stacktrace --no-daemon
#fi
