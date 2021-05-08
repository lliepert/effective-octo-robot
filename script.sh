INPUT_FILE=$1
CUR_TIME=`date +%s`
FOLDER=videos_$CUR_TIME

echo Storing output in $FOLDER
mkdir $FOLDER

while IFS= read -r line; do
  youtube-dl -f 'bestvideo[height<=240]+bestaudio[ext=m4a]/best[height<=240]/best' --restrict-filename $line
done < $INPUT_FILE
