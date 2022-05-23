GIT_DIRECTORY_PATH_LIST=$(find . -name .git)

for path in $GIT_DIRECTORY_PATH_LIST ; do
	PARENT="$(dirname "$path")"
	echo $PARENT
	git -C $PARENT pull
done
	
