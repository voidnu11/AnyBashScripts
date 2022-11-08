#!/bin/bash

DIR=`dirname $0`
RPATH=`realpath $DIR`

INDEX_HTML="$RPATH/index.html"
rm -f $INDEX_HTML 2>/dev/null

echo "<html><head></head><body>" >> $INDEX_HTML
echo "<pre style=\"word-wrap: break-word; white-space: pre-wrap;\">" >> $INDEX_HTML

START_COLLECT_CPU=`date +%s.%N`
bash $RPATH/scripts/cpu.sh $INDEX_HTML $RPATH
END_COLLECT_CPU=`date +%s.%N`

START_COLLECT_MEMORY=`date +%s.%N`
bash $RPATH/scripts/memory.sh $INDEX_HTML $RPATH
END_COLLECT_MEMORY=`date +%s.%N`

START_COLLECT_SPACE=`date +%s.%N`
bash $RPATH/scripts/space.sh $INDEX_HTML $RPATH
END_COLLECT_SPACE=`date +%s.%N`

TIME_COLLECT_CPU=`echo print $END_COLLECT_CPU-$START_COLLECT_CPU | perl`
TIME_COLLECT_MEMORY=`echo print $END_COLLECT_MEMORY-$START_COLLECT_MEMORY | perl`
TIME_COLLECT_SPACE=`echo print $END_COLLECT_SPACE-$START_COLLECT_SPACE | perl`

printf "node_scrape_collector_duration_seconds{collector=\"cpu\"} %.9g\n" "$TIME_COLLECT_CPU" >> $INDEX_HTML
printf "node_scrape_collector_duration_seconds{collector=\"meminfo\"} %.9g\n" "$TIME_COLLECT_MEMORY" >> $INDEX_HTML
printf "node_scrape_collector_duration_seconds{collector=\"filesystem\"} %.9g\n" "$TIME_COLLECT_SPACE" >> $INDEX_HTML
echo "node_scrape_collector_success{collector=\"cpu\"} 1" >> $INDEX_HTML
echo "node_scrape_collector_success{collector=\"meminfo\"} 1" >> $INDEX_HTML
echo "node_scrape_collector_success{collector=\"filesystem\"} 1" >> $INDEX_HTML
echo "</pre></body></html>" >> $INDEX_HTML
