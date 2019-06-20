#!/usr/bin/bash
# -*- coding:utf-8 -*-

python extract_barcodes.py 190607_NS500645_0189_AHHVTWBGXB_RUN189_GF.fastq.gz GTAC > passage1.lst
python extract_barcodes.py 190607_NS500645_0189_AHHVTWBGXB_RUN189_GF.fastq.gz TAGC > passage2.lst
python extract_barcodes.py 190607_NS500645_0189_AHHVTWBGXB_RUN189_GF.fastq.gz CAGT > passage3.lst
python extract_barcodes.py 190607_NS500645_0189_AHHVTWBGXB_RUN189_GF.fastq.gz CGAT > passage4.lst
python extract_barcodes.py 190607_NS500645_0189_AHHVTWBGXB_RUN189_GF.fastq.gz ACGT > freeze.lst
python extract_barcodes.py 190607_NS500645_0189_AHHVTWBGXB_RUN189_GF.fastq.gz CATG > thaw.lst

starcode -d2 passage1.lst > passage1.stc
starcode -d2 passage2.lst > passage2.stc
starcode -d2 passage3.lst > passage3.stc
starcode -d2 passage4.lst > passage4.stc
starcode -d2 freeze.lst > freeze.stc
starcode -d2 thaw.lst > thaw.stc

R -f plot_diversity_curve.R
