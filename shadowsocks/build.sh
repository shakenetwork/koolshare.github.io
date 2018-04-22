#!/bin/sh

MODULE=shadowsocks
VERSION=`cat ./shadowsocks/ss/version|sed -n 1p`
TITLE=科学上网
DESCRIPTION=科学上网
HOME_URL=Main_Ss_Content.asp

# Check and include base
DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"
if [ "$MODULE" == "" ]; then
	echo "module not found"
	exit 1
fi

if [ -f "$DIR/$MODULE/$MODULE/install.sh" ]; then
	echo "install script not found"
	exit 2
fi

# now include build_base.sh
. $DIR/../softcenter/build_base.sh

# change to module directory
cd $DIR

# do something here
do_build_result

# backup latested package after pack
backup_version=`cat version | sed -n 1p`
backup_tar_md5=`cat version | sed -n 2p`
echo backup VERSION $backup_version
cp ${MODULE}.tar.gz ./history/${MODULE}_$backup_version.tar.gz
sed -i "/$backup_version/d" ./history/version
echo $backup_tar_md5  ${MODULE}_$backup_version.tar.gz >> ./history/version
