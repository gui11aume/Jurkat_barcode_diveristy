#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys
import seeq

from gzopen import gzopen

T7 = seeq.compile('TATAGTGAGTCGTATTAAAA', 3)

def main(f, indx):
   for lineno,line in enumerate(f):
      if lineno % 4 != 1: continue
      try:
         barcode,suffix = T7.match(line).split()
         if 14 < len(barcode) < 25 and suffix.startswith(indx):
            print barcode
      except (AttributeError, ValueError, IndexError) as e:
         continue

if __name__ == '__main__':
   with gzopen(sys.argv[1]) as f:
      main(f, sys.argv[2])
