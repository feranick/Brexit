#!/bin/bash

page="$(curl http://www.bbc.com/news)"
#echo "$page"

#ramanspectrumId=$(echo $molinfo | sed 's/\"), \"str.*$//' | sed 's/.*\"ramanspectrum_id" : ObjectId(\"//')

leave=$(echo $page | sed 's/.*\"leaveVoteCount\" class=\"eu-ref-infographic__total-votes\">//')
leave=$(echo $leave | sed 's/<\/div> <div class=\"eu-ref-infographic__votes\".*$//')
leaveN=$(echo $leave | sed 's/,/\./g')
leave=$(echo $leave | sed 's/,//g')

remain=$(echo $page | sed 's/.*\"remainVoteCount\" class=\"eu-ref-infographic__total-votes\">//')
remain=$(echo $remain | sed 's/<\/div> <div class=\"eu-ref-infographic__votes\".*$//')
remainN=$(echo $remain | sed 's/,/\./g')
remain=$(echo $remain | sed 's/,//g')

delta_remain=$(echo "scale=2;100*$remain/($remain+$leave)" | bc -l)
delta_leave=$(echo "scale=2;100*$leave/($remain+$leave)" | bc -l)

numres=$(echo $page | sed 's/.*data-name=\"leftToDeclare\">//')
numres=$(echo $numres | sed 's/ results left to declare.*$//')

echo
echo " Leave in EU: " $leaveN "("$delta_leave"%)"
echo " Remain in EU:" $remainN "("$delta_remain"%)"
echo " Results left to declare:" $numres
echo
date
echo

#echo "<meta http-equiv=\"REFRESH\" content=\"2;url=http://berrycup.mit.edu/brexit\"></HEAD>" > index.html
#echo "<head><title>Will the UK leave the EU? Follow in real time!</title></head>" >> index.html
#echo "<html><body><h1> Leave  EU: " $leaveN "("$delta_leave"%)</h1></body></html>" \
#   "<h1> Remain in EU:" $remainN "("$delta_remain"%)</h1>" >> index.html
#echo "<p>Results left to declare: "$numres"</p>" >> index.html
#echo "<p>"$(date)"</p><p>Data from <a href=\"http://www.bbc.com/news\">BBC News</a></p>" >> index.html
#echo "</body></html>" >> index.html

