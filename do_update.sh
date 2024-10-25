#!/bin/bash

python3 ../caissatrack/plotdata.py chopstrack.csv --cutOff 200 --negplot --logplot --edgeMin 90 --edgeMax 105 --PvLengthPlot pvlength.png

git add chopstrack.png chopstrackpv.png chopstracktime.png
git diff --staged --quiet || git commit -m "update plots"
git push origin main >&push.log
