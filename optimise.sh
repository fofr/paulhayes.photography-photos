# https://github.com/JamieMason/ImageOptim-CLI
if [ $# -eq 0 ]
  then
    echo "Optimising all images"
    imageOptim -d 1720/
    imageOptim -d 860/
    imageOptim -d 435/
    imageOptim -d 380/
    imageOptim -d square/380/
    imageOptim -d watermarked/1720/
    imageOptim -d watermarked/435/
    echo "Second pass"
    imageOptim -d 1720/
    imageOptim -d 860/
    imageOptim -d 435/
    imageOptim -d 380/
    imageOptim -d square/380/
    imageOptim -d watermarked/1720/
    imageOptim -d watermarked/435/
  else
    echo "Optimising images that begin with '$1', starting with JPEGmini"
    find 1720/$1* | imageOptim -j
    find 860/$1* | imageOptim -j
    find 435/$1* | imageOptim -j
    find 380/$1* | imageOptim -j
    find square/380/$1* | imageOptim -j
    find watermarked/1720/$1* | imageOptim -j
    find watermarked/435/$1* | imageOptim -j
    echo "Second pass (without JPEGmini)"
    find 1720/$1* | imageOptim
    find 860/$1* | imageOptim
    find 435/$1* | imageOptim
    find 380/$1* | imageOptim
    find square/380/$1* | imageOptim
    find watermarked/1720/$1* | imageOptim
    find watermarked/435/$1* | imageOptim
fi
