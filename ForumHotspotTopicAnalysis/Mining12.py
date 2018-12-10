# -*- coding: utf-8 -*-
from __future__ import print_function
import pandas as pd
from jieba import analyse


datafile = 'C:\\Users\\Administrator\\PycharmProjects\\untitled2\\project_originaldata_cleaned.xls'
data = pd.read_excel(datafile)

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

print(data[u'标题'][0])
oup_str = ''
for k in range(250):
    oup_str += (data[u'标题'][k] + ' ')

for keyword, weight in analyse.extract_tags(oup_str, withWeight=True):
    print("%s %s"%(keyword, weight))
for keyword, weight in analyse.textrank(oup_str, withWeight=True):
    print("%s %s"%(keyword, weight))