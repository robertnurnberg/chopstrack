#!/bin/bash

python3 ../caissatrack/plotdata.py chopstrack.csv --logplot --cutOff 200 --negplot --logplot --edgeMin 85 --edgeMax 105 --PvLengthPlot pvlength.png

git add chopstrack.png chopstrackpv.png chopstracktime.png
git diff --staged --quiet || git commit -m "update plots"
git push origin main >&push.log
