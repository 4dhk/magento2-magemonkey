#sh

### This script is assume that the repo is under [project folder]/submodules/magento2-magemonkey.
### Folder name is not a problem
case "$(uname)" in
	Darwin)
		DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	;;
	Linux)
		DIR="$( cd "$( dirname $(readlink -f $0) )" && pwd )"
	;;
	*)
		DIR="$( cd "$( dirname $(readlink -f $0) )" && pwd )"
	;;
esac
TargetAppDir=$DIR/../../app

echo "Working Directory:"$DIR
echo "Target Dir:"$TargetAppDir

chown -R :www-data ./*

#remove previous installed plugin resources
rm -rf $TargetAppDir/code/Ebizmarts/MageMonkey

# Copy plugin resources
mkdir -p $TargetAppDir/code/Ebizmarts
ln -s $DIR $TargetAppDir/code/Ebizmarts/MageMonkey

GREEN='\033[1;32m'
NC='\033[0m'
echo "Please run ${GREEN}php bin/magento setup:upgrade${NC} if necessary."
