INPUT_FILE=$1
CUR_TIME=`date +%s`
FOLDER=videos_$CUR_TIME

echo Storing output in $FOLDER
mkdir $FOLDER
cd $FOLDER

while IFS= read -r line; do
  youtube-dl -f 'bestvideo[height<=240][ext=mp4]/worstvideo[ext=mp4]' --restrict-filename $line
done < ../$INPUT_FILE
