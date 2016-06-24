# Brexit
Tracks in real time the results of the UK referendum "Brexit"

Description:
=============

Three scripts:
1. brexit.sh: pulls voting results from BBC News produces percentages and create index.html page with the results.
2. brexit_bash.sh: puls voting results from BBC News, produces percentages and displays the results inline in bash.
3. run_brexit.sh: script to cyclically run brexit.sh every x seconds. 

Running:
========

To run it, copy 1 and 3 above in an empty folder in /var/www/. Run run_brexit.sh &.

Requirements: 
==============

bc is needed for displaying the correct percentages.