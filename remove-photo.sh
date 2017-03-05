echo "Deleting resized images that match '$1'"
find 1720/$1 -exec rm {} \;
find 1280/$1 -exec rm {} \;
find 860/$1 -exec rm {} \;
find 853/$1 -exec rm {} \;
find 435/$1 -exec rm {} \;
find 380/$1 -exec rm {} \;
find square/380/$1 -exec rm {} \;
find watermarked/1720/$1 -exec rm {} \;
find watermarked/435/$1 -exec rm {} \;
find watermarked/380/$1 -exec rm {} \;
