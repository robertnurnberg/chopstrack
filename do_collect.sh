#!/bin/bash

# exit on errors
set -e

temp_file="_tmp_chops_cdbpv.epd"

if [ -f "$temp_file" ]; then
    echo "$temp_file already exists. Exiting."
    exit 0
fi

python ../cdblib/cdbbulkpv.py -c 8 --stable --user rob chops.epd >"$temp_file"

mv "$temp_file" chops_cdbpv.epd

python ../caissatrack/caissatrack.py chops_cdbpv.epd >>chopstrack.csv
python ../caissatrack/extract_fens.py chops_cdbpv.epd --shortest 100 --ignore2folds >chops_daily_shortest.epd
python ../caissatrack/extract_fens.py chops_cdbpv.epd --evalMin 90 --evalMax 105 >chops_daily_edgy.epd

git add chops_cdbpv.epd chopstrack.csv chops_daily_shortest.epd chops_daily_edgy.epd
git diff --staged --quiet || git commit -m "update data"
git push origin main >&push.log
