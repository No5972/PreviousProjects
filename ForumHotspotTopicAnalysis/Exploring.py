# -*- coding: utf-8 -*-
import pandas as pd;
datafile = 'C:\\Users\\Administrator\\PycharmProjects\\untitled2\\project_originaldata_cleaned.xls'
resultfile = 'project_explore.xls'
data = pd.read_excel(datafile)
allsubforums = pd.Series(data[u'°æ¿é']).value_counts()
print(allsubforums) 