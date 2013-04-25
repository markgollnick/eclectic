#!/bin/bash
# eclectic.sh
# @author Mark R. Gollnick <mark.r.gollnick@gmail.com>
# @license Boost Software Licence v1.0 <http://www.boost.org/LICENSE_1_0.txt>
# @date 2012 Apr 26, Thu, 06:34 PM CST
# @desc Eclectic is to eclipse plugins as workspaces are to projects.
# "Eclipse Configuration Loader Easily Changes The IDE Config," or
# "Eclectic Can Let Eclipse Change The IDE Config"

ECLECTIC_DIR=configs

if [ ! -d $ECLECTIC_DIR ]; then
  mkdir $ECLECTIC_DIR;
fi;

function eclipse_run()
{
#   if [ ! -d $ECLECTIC_DIR/$1 ]; then
#     mkdir -p "$ECLECTIC_DIR/$1";
#     cp -R configuration "$ECLECTIC_DIR/$1/";
#   fi;
  eclipsec.exe -clean -configuration $ECLECTIC_DIR/$1/configuration
}

ECLIPSE_CONF=$1
if [ -z "$ECLIPSE_CONF" ]; then
  echo "ECLECTIC.SH
Eclectic Can Let Eclipse Change The IDE Config

Specify a configuration name, or press CTRL + C to cancel.
"
  IFS_TEMP=$IFS;
  IFS=$'\n';
  for dirName in `ls -l $ECLECTIC_DIR | grep '^d'`; do
    echo ${dirName/* /};
  done;
  IFS=$IFS_TEMP;
  read -p "
" ECLIPSE_CONF;
fi;
if [ ! -z "$ECLIPSE_CONF" ]; then
  eclipse_run $ECLIPSE_CONF
fi;
