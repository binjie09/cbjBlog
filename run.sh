echo $#
if [ $# == 1 ] ; then
docker run  -p 1313:1313 -e HUGO_BASE_URL=$1 cbjblog:v0.1
else
docker run -p 1313:1313 cbjblog:v0.1
fi

