import numpy as np
from sys import *
import scipy.misc
import matplotlib
import os


root_dir =argv[1]+'/masks'
n=1
for file in os.listdir(root_dir):
	file_name = root_dir + "/" + file
	if n!=1:
		im=scipy.misc.imread(file_name)
		mask=mask+im
	else:
		mask=scipy.misc.imread(file_name)
		n=n+1
		
scipy.misc.imsave(argv[1]+'_masks.png', mask)
