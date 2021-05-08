INPUT_FILE=$1
CUR_TIME=`date +%s`
FOLDER=videos_$CUR_TIME

echo Storing output in $FOLDER
mkdir $FOLDER

while IFS= read -r line; do
  youtube-dl -f 'bestvideo[height<=240][ext=mp4]/worstvideo[ext=mp4]' -o "${FOLDER}/%(title)s-%(id)s.%(ext)s" --restrict-filename $line
done < $INPUT_FILE
