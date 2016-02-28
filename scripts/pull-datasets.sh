#!/bin/bash

usage ()
{
    echo "$0 [-h] [-d download_directory]"
    echo "-h displays this usage"
    echo "-d specifies the directory where to download the data files"
}

OPTIND=1         # Reset in case getopts has been used previously in the shell.

DOWNLOAD_DIR="."
while getopts ":h?nd:" OPT; do
  case "$OPT" in
    h|\?)
        usage
        exit 0 
        ;;
    d)
        DOWNLOAD_DIR=$OPTARG
        ;;
    *)
        usage
        exit 1
        ;;
  esac
done

shift $((OPTIND-1))

# Retrieve the NOAA training and test set
echo "Retrieving NOAA test set, this may take some time..."
wget -P $DOWNLOAD_DIR ftp://ftp.nodc.noaa.gov/nodc/archive/arc0075/0127422/2.3/data/0-data/FINAL_Plankton_Segments_12082014.tar

wget -P $DOWNLOAD_DIR ftp://ftp.nodc.noaa.gov/nodc/archive/arc0075/0127422/2.3/data/0-data/main.R
wget -P $DOWNLOAD_DIR ftp://ftp.nodc.noaa.gov/nodc/archive/arc0075/0127422/2.3/data/0-data/solution.R
wget -P $DOWNLOAD_DIR ftp://ftp.nodc.noaa.gov/nodc/archive/arc0075/0127422/2.3/data/1-data/Technical_Doc_0127422.pdf 



