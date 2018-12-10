#-*- coding:utf-8 -*
# @Describe: Find out all broken net disk links in EXNPK forum. This site server is fragile - do not abuse.

import requests
import re
import os

header = {"user-agent" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11", "cookie" : "*****"}
for x in range(1,101):
	x = bytes(x)
	testUrl = "http://bbs.exnpk.com/thread-"+x+"-1-1.html"
	# print testUrl
	response = requests.get(testUrl, headers = header)
	urls = re.findall(r'pan\.[^\s]*</', response.text)
	# print urls
	for s in urls:
		t = 'https://'+s.strip('</')
		# print t
		response2 = requests.get(t, headers = header2)
		isBroken = re.findall(r'share_nofound_des', response2.text)
		# print isBroken
		if len(isBroken) != 0:
			print testUrl + "," + t + ",BROKEN"
os.system("pause")