#!/bin/bash
#
# Requires bash version >= 4
# 
# The script uses the command line tool 'curl' for querying
# the MAST Download service for public and protected data. 
#
# FROM:
# Prop. Type: GO
# Category:   SOLAR SYSTEM
# ID:         10268
# Cycle:      13
# Title:	    Recovery of three faint Kuiper Belt Objects discovered #with HST
# PI:         David Trilling
#
# AND
#
# Prop. Type: GO
# Category:   GALAXIES
# ID:         10003
# Cycle:      12
# Title:	    Deep Chandra and Hubble Observations of NGC4697, the Nearest
# 		    Optically Luminous, X-ray Faint Elliptical Galaxy
# PI:         Craig Sarazin


type -P curl >&/dev/null || { echo "This script requires curl. Exiting." >&2; exit 1; }



# Check for existing Download Folder
# prompt user for overwrite, if found
let EXTENSION=0
FOLDER=MAST
DOWNLOAD_FOLDER="${HOME}/datasets/${FOLDER}"
if [ -d $DOWNLOAD_FOLDER ]
then
  echo -n "Download folder ${DOWNLOAD_FOLDER} found, (C)ontinue writing to existing folder or use (N)ew folder? [N]> "
  read -n1 ans
  if [ "$ans" = "c" -o "$ans" = "C" ]
  then
    echo ""
    echo "Downloading to existing folder: ${DOWNLOAD_FOLDER}"
    CONT="-C -"
  else
    while [ -d $DOWNLOAD_FOLDER ]
    do
      ((EXTENSION++))
      DOWNLOAD_FOLDER="${FOLDER}-${EXTENSION}"
    done

    echo ""
    echo "Downloading to new folder: ${DOWNLOAD_FOLDER}"
  fi
fi

# mkdir if it doesn't exist and download files there. 
mkdir -p ${DOWNLOAD_FOLDER}

cat >${DOWNLOAD_FOLDER}/MANIFEST.HTML<<EOT
<!DOCTYPE html>
<html>
    <head>
        <title>MAST_2024-02-07T0307</title>
    </head>
    <body>
        <h2>Manifest for File: MAST_2024-02-07T0307</h2>
        <h3>Total Files: 69</h3>
        <table cellspacing="0" cellpadding="4" rules="all" style="border-width:5px; border-style:solid; border-collapse:collapse;">
            <tr>
                <td><b>URI</b></td>
                <td><b>File</b></td>
                <td><b>Access</b></td>
                <td><b>Status</b></td>
                <td><b>Logged In User</b></td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_09_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_09/hst_10268_05_acs_wfc_f606w_09_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805grq_drz.fits</td>
                <td>HST/j8y805grq/j8y805grq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_03_drz.fits</td>
                <td>HLA/hst_10268_01_acs_wfc_f606w_03/hst_10268_01_acs_wfc_f606w_03_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_04_drz.fits</td>
                <td>HLA/hst_10268_03_acs_wfc_f606w_04/hst_10268_03_acs_wfc_f606w_04_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y803dnq_drz.fits</td>
                <td>HST/j8y803dnq/j8y803dnq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y804e4q_drz.fits</td>
                <td>HST/j8y804e4q/j8y804e4q_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y803djq_drz.fits</td>
                <td>HST/j8y803djq/j8y803djq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_05_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_05/hst_10268_05_acs_wfc_f606w_05_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y804e6q_drz.fits</td>
                <td>HST/j8y804e6q/j8y804e6q_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y803diq_drz.fits</td>
                <td>HST/j8y803diq/j8y803diq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y804eaq_drz.fits</td>
                <td>HST/j8y804eaq/j8y804eaq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805gjq_drz.fits</td>
                <td>HST/j8y805gjq/j8y805gjq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10003_01_acs_wfc_total_drz.fits</td>
                <td>HLA/hst_10003_01_acs_wfc_total/hst_10003_01_acs_wfc_total_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_01_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_01/hst_10268_05_acs_wfc_f606w_01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y802czq_drz.fits</td>
                <td>HST/j8y802czq/j8y802czq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_10_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_10/hst_10268_05_acs_wfc_f606w_10_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10003_01_acs_wfc_f850lp_drz.fits</td>
                <td>HLA/hst_10003_01_acs_wfc_f850lp/hst_10003_01_acs_wfc_f850lp_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_03_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_03/hst_10268_05_acs_wfc_f606w_03_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8vg01011_drz.fits</td>
                <td>HST/j8vg01010/j8vg01011_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y802ctq_drz.fits</td>
                <td>HST/j8y802ctq/j8y802ctq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y802cxq_drz.fits</td>
                <td>HST/j8y802cxq/j8y802cxq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y803dpq_drz.fits</td>
                <td>HST/j8y803dpq/j8y803dpq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y804e8q_drz.fits</td>
                <td>HST/j8y804e8q/j8y804e8q_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805gcq_drz.fits</td>
                <td>HST/j8y805gcq/j8y805gcq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805gnq_drz.fits</td>
                <td>HST/j8y805gnq/j8y805gnq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_03_drz.fits</td>
                <td>HLA/hst_10268_02_acs_wfc_f606w_03/hst_10268_02_acs_wfc_f606w_03_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10003_01_acs_wfc_f475w_drz.fits</td>
                <td>HLA/hst_10003_01_acs_wfc_f475w/hst_10003_01_acs_wfc_f475w_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f555w_02_drz.fits</td>
                <td>HLA/hst_10268_04_acs_wfc_f555w_02/hst_10268_04_acs_wfc_f555w_02_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_08_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_08/hst_10268_05_acs_wfc_f606w_08_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805gtq_drz.fits</td>
                <td>HST/j8y805gtq/j8y805gtq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y804e3q_drz.fits</td>
                <td>HST/j8y804e3q/j8y804e3q_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f814w_02_drz.fits</td>
                <td>HLA/hst_10268_04_acs_wfc_f814w_02/hst_10268_04_acs_wfc_f814w_02_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_04_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_04/hst_10268_05_acs_wfc_f606w_04_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_05_drz.fits</td>
                <td>HLA/hst_10268_01_acs_wfc_f606w_05/hst_10268_01_acs_wfc_f606w_05_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y801bzq_drz.fits</td>
                <td>HST/j8y801bzq/j8y801bzq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_02_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_02/hst_10268_05_acs_wfc_f606w_02_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_03_drz.fits</td>
                <td>HLA/hst_10268_03_acs_wfc_f606w_03/hst_10268_03_acs_wfc_f606w_03_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y803dlq_drz.fits</td>
                <td>HST/j8y803dlq/j8y803dlq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_02_drz.fits</td>
                <td>HLA/hst_10268_01_acs_wfc_f606w_02/hst_10268_01_acs_wfc_f606w_02_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y802csq_drz.fits</td>
                <td>HST/j8y802csq/j8y802csq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_06_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_06/hst_10268_05_acs_wfc_f606w_06_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_01_drz.fits</td>
                <td>HLA/hst_10268_02_acs_wfc_f606w_01/hst_10268_02_acs_wfc_f606w_01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/hst_10003_01_wfpc2_pc_f606w_u8vg01_drz.fits</td>
                <td>HST/hst_10003_01_wfpc2_pc_f606w_u8vg01/hst_10003_01_wfpc2_pc_f606w_u8vg01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8vg01021_drz.fits</td>
                <td>HST/j8vg01020/j8vg01021_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805gfq_drz.fits</td>
                <td>HST/j8y805gfq/j8y805gfq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y801buq_drz.fits</td>
                <td>HST/j8y801buq/j8y801buq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y801c2q_drz.fits</td>
                <td>HST/j8y801c2q/j8y801c2q_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_02_drz.fits</td>
                <td>HLA/hst_10268_02_acs_wfc_f606w_02/hst_10268_02_acs_wfc_f606w_02_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y802cvq_drz.fits</td>
                <td>HST/j8y802cvq/j8y802cvq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f555w_03_drz.fits</td>
                <td>HLA/hst_10268_04_acs_wfc_f555w_03/hst_10268_04_acs_wfc_f555w_03_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_04_drz.fits</td>
                <td>HLA/hst_10268_02_acs_wfc_f606w_04/hst_10268_02_acs_wfc_f606w_04_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8vg01c0q_drz.fits</td>
                <td>HST/j8vg01c0q/j8vg01c0q_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805ghq_drz.fits</td>
                <td>HST/j8y805ghq/j8y805ghq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/hst_10003_01_wfpc2_pc_f814w_u8vg01_drz.fits</td>
                <td>HST/hst_10003_01_wfpc2_pc_f814w_u8vg01/hst_10003_01_wfpc2_pc_f814w_u8vg01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_01_drz.fits</td>
                <td>HLA/hst_10268_01_acs_wfc_f606w_01/hst_10268_01_acs_wfc_f606w_01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805glq_drz.fits</td>
                <td>HST/j8y805glq/j8y805glq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_01_drz.fits</td>
                <td>HLA/hst_10268_03_acs_wfc_f606w_01/hst_10268_03_acs_wfc_f606w_01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_04_drz.fits</td>
                <td>HLA/hst_10268_01_acs_wfc_f606w_04/hst_10268_01_acs_wfc_f606w_04_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f555w_01_drz.fits</td>
                <td>HLA/hst_10268_04_acs_wfc_f555w_01/hst_10268_04_acs_wfc_f555w_01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805gpq_drz.fits</td>
                <td>HST/j8y805gpq/j8y805gpq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_05_drz.fits</td>
                <td>HLA/hst_10268_03_acs_wfc_f606w_05/hst_10268_03_acs_wfc_f606w_05_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_07_drz.fits</td>
                <td>HLA/hst_10268_05_acs_wfc_f606w_07/hst_10268_05_acs_wfc_f606w_07_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/hst_10003_01_wfpc2_pc_total_u8vg01_drz.fits</td>
                <td>HST/hst_10003_01_wfpc2_pc_total_u8vg01/hst_10003_01_wfpc2_pc_total_u8vg01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y801bxq_drz.fits</td>
                <td>HST/j8y801bxq/j8y801bxq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_05_drz.fits</td>
                <td>HLA/hst_10268_02_acs_wfc_f606w_05/hst_10268_02_acs_wfc_f606w_05_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_02_drz.fits</td>
                <td>HLA/hst_10268_03_acs_wfc_f606w_02/hst_10268_03_acs_wfc_f606w_02_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y805gdq_drz.fits</td>
                <td>HST/j8y805gdq/j8y805gdq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f814w_01_drz.fits</td>
                <td>HLA/hst_10268_04_acs_wfc_f814w_01/hst_10268_04_acs_wfc_f814w_01_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:HST/product/j8y801btq_drz.fits</td>
                <td>HST/j8y801btq/j8y801btq_drz.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
        </table>
    </body>
</html>

EOT

# Download Product Files:



cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_09_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_09/hst_10268_05_acs_wfc_f606w_09_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_09/hst_10268_05_acs_wfc_f606w_09_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_09_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805grq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805grq/j8y805grq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805grq/j8y805grq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805grq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_03_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_01_acs_wfc_f606w_03/hst_10268_01_acs_wfc_f606w_03_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_01_acs_wfc_f606w_03/hst_10268_01_acs_wfc_f606w_03_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_01_acs_wfc_f606w_03_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_04_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_03_acs_wfc_f606w_04/hst_10268_03_acs_wfc_f606w_04_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_03_acs_wfc_f606w_04/hst_10268_03_acs_wfc_f606w_04_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_03_acs_wfc_f606w_04_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y803dnq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y803dnq/j8y803dnq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y803dnq/j8y803dnq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y803dnq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y804e4q_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y804e4q/j8y804e4q_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y804e4q/j8y804e4q_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y804e4q_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y803djq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y803djq/j8y803djq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y803djq/j8y803djq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y803djq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_05_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_05/hst_10268_05_acs_wfc_f606w_05_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_05/hst_10268_05_acs_wfc_f606w_05_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_05_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y804e6q_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y804e6q/j8y804e6q_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y804e6q/j8y804e6q_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y804e6q_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y803diq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y803diq/j8y803diq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y803diq/j8y803diq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y803diq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y804eaq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y804eaq/j8y804eaq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y804eaq/j8y804eaq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y804eaq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805gjq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805gjq/j8y805gjq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805gjq/j8y805gjq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805gjq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10003_01_acs_wfc_total_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10003_01_acs_wfc_total/hst_10003_01_acs_wfc_total_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10003_01_acs_wfc_total/hst_10003_01_acs_wfc_total_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10003_01_acs_wfc_total_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_01/hst_10268_05_acs_wfc_f606w_01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_01/hst_10268_05_acs_wfc_f606w_01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y802czq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y802czq/j8y802czq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y802czq/j8y802czq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y802czq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_10_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_10/hst_10268_05_acs_wfc_f606w_10_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_10/hst_10268_05_acs_wfc_f606w_10_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_10_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10003_01_acs_wfc_f850lp_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10003_01_acs_wfc_f850lp/hst_10003_01_acs_wfc_f850lp_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10003_01_acs_wfc_f850lp/hst_10003_01_acs_wfc_f850lp_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10003_01_acs_wfc_f850lp_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_03_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_03/hst_10268_05_acs_wfc_f606w_03_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_03/hst_10268_05_acs_wfc_f606w_03_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_03_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8vg01011_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8vg01010/j8vg01011_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8vg01010/j8vg01011_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8vg01011_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y802ctq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y802ctq/j8y802ctq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y802ctq/j8y802ctq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y802ctq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y802cxq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y802cxq/j8y802cxq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y802cxq/j8y802cxq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y802cxq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y803dpq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y803dpq/j8y803dpq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y803dpq/j8y803dpq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y803dpq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y804e8q_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y804e8q/j8y804e8q_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y804e8q/j8y804e8q_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y804e8q_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805gcq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805gcq/j8y805gcq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805gcq/j8y805gcq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805gcq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805gnq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805gnq/j8y805gnq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805gnq/j8y805gnq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805gnq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_03_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_02_acs_wfc_f606w_03/hst_10268_02_acs_wfc_f606w_03_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_02_acs_wfc_f606w_03/hst_10268_02_acs_wfc_f606w_03_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_02_acs_wfc_f606w_03_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10003_01_acs_wfc_f475w_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10003_01_acs_wfc_f475w/hst_10003_01_acs_wfc_f475w_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10003_01_acs_wfc_f475w/hst_10003_01_acs_wfc_f475w_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10003_01_acs_wfc_f475w_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f555w_02_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_04_acs_wfc_f555w_02/hst_10268_04_acs_wfc_f555w_02_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_04_acs_wfc_f555w_02/hst_10268_04_acs_wfc_f555w_02_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_04_acs_wfc_f555w_02_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_08_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_08/hst_10268_05_acs_wfc_f606w_08_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_08/hst_10268_05_acs_wfc_f606w_08_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_08_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805gtq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805gtq/j8y805gtq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805gtq/j8y805gtq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805gtq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y804e3q_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y804e3q/j8y804e3q_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y804e3q/j8y804e3q_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y804e3q_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f814w_02_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_04_acs_wfc_f814w_02/hst_10268_04_acs_wfc_f814w_02_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_04_acs_wfc_f814w_02/hst_10268_04_acs_wfc_f814w_02_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_04_acs_wfc_f814w_02_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_04_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_04/hst_10268_05_acs_wfc_f606w_04_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_04/hst_10268_05_acs_wfc_f606w_04_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_04_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_05_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_01_acs_wfc_f606w_05/hst_10268_01_acs_wfc_f606w_05_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_01_acs_wfc_f606w_05/hst_10268_01_acs_wfc_f606w_05_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_01_acs_wfc_f606w_05_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y801bzq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y801bzq/j8y801bzq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y801bzq/j8y801bzq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y801bzq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_02_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_02/hst_10268_05_acs_wfc_f606w_02_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_02/hst_10268_05_acs_wfc_f606w_02_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_02_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_03_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_03_acs_wfc_f606w_03/hst_10268_03_acs_wfc_f606w_03_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_03_acs_wfc_f606w_03/hst_10268_03_acs_wfc_f606w_03_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_03_acs_wfc_f606w_03_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y803dlq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y803dlq/j8y803dlq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y803dlq/j8y803dlq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y803dlq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_02_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_01_acs_wfc_f606w_02/hst_10268_01_acs_wfc_f606w_02_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_01_acs_wfc_f606w_02/hst_10268_01_acs_wfc_f606w_02_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_01_acs_wfc_f606w_02_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y802csq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y802csq/j8y802csq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y802csq/j8y802csq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y802csq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_06_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_06/hst_10268_05_acs_wfc_f606w_06_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_06/hst_10268_05_acs_wfc_f606w_06_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_06_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_02_acs_wfc_f606w_01/hst_10268_02_acs_wfc_f606w_01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_02_acs_wfc_f606w_01/hst_10268_02_acs_wfc_f606w_01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_02_acs_wfc_f606w_01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/hst_10003_01_wfpc2_pc_f606w_u8vg01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/hst_10003_01_wfpc2_pc_f606w_u8vg01/hst_10003_01_wfpc2_pc_f606w_u8vg01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/hst_10003_01_wfpc2_pc_f606w_u8vg01/hst_10003_01_wfpc2_pc_f606w_u8vg01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/hst_10003_01_wfpc2_pc_f606w_u8vg01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8vg01021_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8vg01020/j8vg01021_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8vg01020/j8vg01021_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8vg01021_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805gfq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805gfq/j8y805gfq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805gfq/j8y805gfq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805gfq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y801buq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y801buq/j8y801buq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y801buq/j8y801buq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y801buq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y801c2q_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y801c2q/j8y801c2q_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y801c2q/j8y801c2q_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y801c2q_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_02_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_02_acs_wfc_f606w_02/hst_10268_02_acs_wfc_f606w_02_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_02_acs_wfc_f606w_02/hst_10268_02_acs_wfc_f606w_02_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_02_acs_wfc_f606w_02_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y802cvq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y802cvq/j8y802cvq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y802cvq/j8y802cvq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y802cvq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f555w_03_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_04_acs_wfc_f555w_03/hst_10268_04_acs_wfc_f555w_03_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_04_acs_wfc_f555w_03/hst_10268_04_acs_wfc_f555w_03_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_04_acs_wfc_f555w_03_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_04_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_02_acs_wfc_f606w_04/hst_10268_02_acs_wfc_f606w_04_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_02_acs_wfc_f606w_04/hst_10268_02_acs_wfc_f606w_04_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_02_acs_wfc_f606w_04_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8vg01c0q_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8vg01c0q/j8vg01c0q_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8vg01c0q/j8vg01c0q_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8vg01c0q_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805ghq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805ghq/j8y805ghq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805ghq/j8y805ghq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805ghq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/hst_10003_01_wfpc2_pc_f814w_u8vg01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/hst_10003_01_wfpc2_pc_f814w_u8vg01/hst_10003_01_wfpc2_pc_f814w_u8vg01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/hst_10003_01_wfpc2_pc_f814w_u8vg01/hst_10003_01_wfpc2_pc_f814w_u8vg01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/hst_10003_01_wfpc2_pc_f814w_u8vg01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_01_acs_wfc_f606w_01/hst_10268_01_acs_wfc_f606w_01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_01_acs_wfc_f606w_01/hst_10268_01_acs_wfc_f606w_01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_01_acs_wfc_f606w_01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805glq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805glq/j8y805glq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805glq/j8y805glq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805glq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_03_acs_wfc_f606w_01/hst_10268_03_acs_wfc_f606w_01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_03_acs_wfc_f606w_01/hst_10268_03_acs_wfc_f606w_01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_03_acs_wfc_f606w_01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_01_acs_wfc_f606w_04_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_01_acs_wfc_f606w_04/hst_10268_01_acs_wfc_f606w_04_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_01_acs_wfc_f606w_04/hst_10268_01_acs_wfc_f606w_04_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_01_acs_wfc_f606w_04_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f555w_01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_04_acs_wfc_f555w_01/hst_10268_04_acs_wfc_f555w_01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_04_acs_wfc_f555w_01/hst_10268_04_acs_wfc_f555w_01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_04_acs_wfc_f555w_01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805gpq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805gpq/j8y805gpq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805gpq/j8y805gpq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805gpq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_05_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_03_acs_wfc_f606w_05/hst_10268_03_acs_wfc_f606w_05_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_03_acs_wfc_f606w_05/hst_10268_03_acs_wfc_f606w_05_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_03_acs_wfc_f606w_05_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_05_acs_wfc_f606w_07_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_05_acs_wfc_f606w_07/hst_10268_05_acs_wfc_f606w_07_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_05_acs_wfc_f606w_07/hst_10268_05_acs_wfc_f606w_07_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_05_acs_wfc_f606w_07_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/hst_10003_01_wfpc2_pc_total_u8vg01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/hst_10003_01_wfpc2_pc_total_u8vg01/hst_10003_01_wfpc2_pc_total_u8vg01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/hst_10003_01_wfpc2_pc_total_u8vg01/hst_10003_01_wfpc2_pc_total_u8vg01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/hst_10003_01_wfpc2_pc_total_u8vg01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y801bxq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y801bxq/j8y801bxq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y801bxq/j8y801bxq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y801bxq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_02_acs_wfc_f606w_05_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_02_acs_wfc_f606w_05/hst_10268_02_acs_wfc_f606w_05_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_02_acs_wfc_f606w_05/hst_10268_02_acs_wfc_f606w_05_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_02_acs_wfc_f606w_05_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_03_acs_wfc_f606w_02_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_03_acs_wfc_f606w_02/hst_10268_03_acs_wfc_f606w_02_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_03_acs_wfc_f606w_02/hst_10268_03_acs_wfc_f606w_02_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_03_acs_wfc_f606w_02_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y805gdq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y805gdq/j8y805gdq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y805gdq/j8y805gdq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y805gdq_drz.fits'





cat <<EOT
<<< Downloading File: mast:HLA/url/cgi-bin/getdata.cgi?dataset=hst_10268_04_acs_wfc_f814w_01_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HLA/hst_10268_04_acs_wfc_f814w_01/hst_10268_04_acs_wfc_f814w_01_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HLA/hst_10268_04_acs_wfc_f814w_01/hst_10268_04_acs_wfc_f814w_01_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HLA/url/cgi-bin/getdata.cgi%3Fdataset%3Dhst_10268_04_acs_wfc_f814w_01_drz.fits'





cat <<EOT
<<< Downloading File: mast:HST/product/j8y801btq_drz.fits
                  To: ${DOWNLOAD_FOLDER}/HST/j8y801btq/j8y801btq_drz.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ${DOWNLOAD_FOLDER}'/HST/j8y801btq/j8y801btq_drz.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2024-02-07T0307.sh&uri=mast:HST/product/j8y801btq_drz.fits'




exit 0
