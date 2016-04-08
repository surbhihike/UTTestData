rm -rf FileCount output output_bkp
git rev-list --max-count=$1 --all --pretty|grep "src/" >output
cp output output_bkp
touch FileCount
while read LINE  
do
  fileProcessed=`cat FileCount|grep $LINE`
  if [[ -z "$fileProcessed" ]] ; then
    number=`cat output_bkp|grep "${LINE}"|wc -l`
    echo "${number} #commits in file ${LINE}">>FileCount
  fi
  
done <output
sort -r FileCount > TopFiles

