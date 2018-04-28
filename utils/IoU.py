import numpy as np
from sys import *
import scipy.misc
import matplotlib
from sys import argv

file=argv[1]
im=scipy.misc.imread('images/'+file+'_original._class.png')
im[im==255] = 1
mask=scipy.misc.imread(file+'_masks.png')
mask[mask==255]=1

overlap = im*mask
union = im + mask
union[union==2]=1

IoU = overlap.sum()/float(union.sum())
print
