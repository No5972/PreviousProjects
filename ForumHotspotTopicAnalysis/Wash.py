# -*- coding: utf-8 -*-

import pandas as pd;
datafile = 'C:\\Users\\Administrator\\PycharmProjects\\untitled2\\project_originaldata_cleaned.xls'
resultfile = 'C:\\Users\\Administrator\\PycharmProjects\\untitled2\\project_originaldata_cleaned_c.xls'

data = pd.read_excel(datafile)
#print(data[u'°æ¿é'])
titles=pd.DataFrame(data[u'±êÌâ'])
print(titles)
titles.to_excel(resultfile)