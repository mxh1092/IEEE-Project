import numpy as np


acts = np.arange(2, 40, 1)
seps = np.array([187, 237, 287, 337, 387])


f = open('batch.bash', 'w')
f.write('#!/bin/bash\n\n')

for i in acts:
    for j in seps:

        f.write('runForte.bash ' +str(i) + ' '+ str(j)+'\n')

f.close()

