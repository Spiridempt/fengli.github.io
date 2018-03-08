#!usr/bin/python
# -*- coding: utf-8 -*-
# codeing = utf-8
import os
import json
import sys
import csv
import xml.etree.cElementTree as ET
from imp import reload
#from timeout import timeout
#import conduct_negation
#reload(sys)
#sys.setdefaultencoding('utf-8')

thislanguage = 'Ruby'

commitfilepath = 'E:\\CrawlData\\checkcheckzz-python-github-projects\\cn.edu.pku.EOSCN.crawler.GitCommitsCrawler'
resultspath = 'E:\\CrawlData\\checkcheckzz-python-github-projects\\cn.edu.pku.EOSCN.crawler.GitCommitsCrawler\\results\\'
writepath = 'E:\\CrawlData\\checkcheckzz-python-github-projects\\cn.edu.pku.EOSCN.crawler.GitCommitsCrawler\\results\\result.txt'

#C:\Users\Administrator.USER01702091351\AppData\Local\Programs\Python\Python36-32

def get_suffix(language):
	suffix_dict = {}
	suffix_dict['Java']=['.java']
	suffix_dict['C']=['.c','.C','.h','.H']
	suffix_dict['C++']=['.cpp','.inl','.hh','.hpp','.ipp','.cp','.cc']
	suffix_dict['Python']=['.py','.pyde','.pyp','.cgi','.rpy']
	suffix_dict['PHP']=['.php','.phps']
	suffix_dict['Ruby']=['.rb', '.jbuilder', '.pluginspec', '.rabl', '.rack']
	suffix_dict['CSS']=['.css', '.scss']
	suffix_dict['HTML']=['.html','.htm','.shtml','.shtm']
	suffix_dict['Go']=['.go']
	suffix_dict['JavaScript']=['.js', '.es', '.gs', '.xsjs', '.xsjslib', '.frag', '.jsb', '.jscad']
	suffix_dict['C#']=['.cs', 'cake', 'cshtml']
	suffix_dict['Objective-C']=['.h', '.m']
	return suffix_dict[language]

	
def get_stats(commitstring, fullname, language):
	stats = []
	thispath = "/home/seitest/PLstudy/" + thislanguage + "/" + fullname + "/commits/"+commitstring+'.json'
#	with open(thispath, "r", -1, 'utf-8', 'ignore') as f:
	with open(thispath, "r") as f:

		
#if null		
		if(os.path.getsize(thispath) == 0):
			stats.append('null')
			stats.append(str(0))
			stats.append(str(0))
			stats.append(str(0))
			stats.append('null')
			return stats
		
#		print commitstring
		try:
			data = json.load(f)
		except:
			stats.append('null')
			stats.append('0')
			stats.append('0')
			stats.append('0')
			print ('!!!')
			return stats
		if data.get('parents') == []:
			stats.append('null')
		else:
			stats.append(data.get('parents')[0].get('sha'))

		try:
			stats.append(data.get('stats').get('total'))
			stats.append(data.get('stats').get('additions'))
			stats.append(data.get('stats').get('deletions'))
		except:
			return stats
		
		message = data.get('commit').get('message')
		if(message.find('format')>-1 or message.find('Format')>-1):
			stats.append('Format')
		elif(message.find('comment')>-1 or message.find('Comment')>-1):
			stats.append('Comment')
		else:
			flag = 0
			index = 0
			while(index < len(data.get('files'))):
				tempname = data.get('files')[index].get('filename')
				if(tempname.find('xml')>-1 or tempname.find('XML')>-1 or tempname.find('README')>-1):
					flag = 1
					break
				index = index + 1
			if(flag == 1):
				stats.append('Document')
			else:
				flag1 = 0
				flag2 = 0
				if(message.find('fix')>-1 or message.find('Fix') > 1):
					flag1 = 1
				if(message.find('#')>-1):
					flag2 = 1
				if (flag1==1 and flag2==1):
					stats.append('fix #')
				elif(flag1 == 1):
					stats.append('fix')
				elif(flag2==1):
					stats.append('#')
				else:
					stats.append('Normal')
		issue_terms = ['#', 'bug', 'issue', 'error', 'typo', ' fault', 'mistake', 'incorrect', 'defect', 'flaw']
		issue_terms_in_message = 0
		j = 0
		while(j<len(issue_terms)):
			if(issue_terms[j].lower() in message.lower()):
				issue_terms_in_message = 1
				break
			j = j + 1
		if(issue_terms_in_message==1 and 'fix' in message.lower()):
			stats.append('ISSUE')
		else:
			stats.append('NULL')
		if('bug' in message.lower() and 'fix' in message.lower()):
			stats.append('BUG')
		else:
			stats.append('NULL')

		filechange = data.get('files')
		specific_change = 0;
		suffix = get_suffix(language)
		flag = 0
		index = 0
		filechangenumber = 0
		while(index < len(filechange)):
			flag = 0
			tempindex = 0
			while(tempindex<len(suffix)):
				if suffix[tempindex] in filechange[index].get('filename'):
					flag = 1
					break
				tempindex = tempindex + 1
			if flag==1:
				specific_change = specific_change + filechange[index].get('changes')
				filechangenumber = filechangenumber + 1
			index = index + 1
		stats.append(specific_change)

		if ('refactor' in message.lower()):
			stats.append('REFACTOR')
		else:
			stats.append('NULL')
		stats.append(str(filechangenumber))

			
		
#		stats.append(data.get('commit').get('message'))
	return stats		
	



def get_totalcommits(fullname):

	print (fullname)


	totalcommits = []
	
	i = 1
	thisfilepath = "/home/seitest/PLstudy/" + thislanguage + "/" + fullname + "/"

	while 1:
		if not (os.path.exists(thisfilepath + "commits_index" + str(i) + ".json")):
			break
		i = i + 1
	endfileno = i - 1	
	

	ccount = 1
	while(ccount <= endfileno):
		with open(thisfilepath+'commits_index'+str(ccount)+'.json', 'r') as f:
			data = json.load(f)
			count = 0
			while count < len(data):			
				shastringfirst = data[count].get('sha')
				totalcommits.append(shastringfirst)
				count = count+1
		ccount = ccount+1
		

	return totalcommits








if __name__=="__main__":
	
	# read_eachfile('d0f6be9886afaee6080cd4b7cd5d165c767b71f0')
#	read_alljsonfiles(commitfilepath,'commons-lang')
	# read_eachjsonfile('021e4dfb501a8e6e5810a4f0efe1267810d62d64','commons-lang')
	
	
	file = open('/home/seitest/totalruby.txt', 'r')
	dict = {}

# read total 100 project names of 5 categories
#	i = 0
#	while(i < 250):
#		line = file.readline()
#		data = line.split(' ')
#		dict[i] = [data[0], data[1], data[2].strip("\n")]
#		i = i + 1

	i = 0
	while(i < 57):
		line = file.readline()
		if(i <0):
			i = i + 1
			continue
		data = line.split(' ')
		first = data[0]
		second = data[1].strip()
		language = thislanguage
		fullname = first + '-' + second
		totalcommits = get_totalcommits(fullname)
		writefile = open("/home/seitest/PLstudy/" + thislanguage + "/" + fullname + '.csv', 'w')

		count  = 0

		tempcount = 0
		while count < len(totalcommits):		
			shastringfirst = totalcommits[count]

			if not os.path.exists("/home/seitest/PLstudy/" + language + "/" + fullname + "/commits/"+shastringfirst+'.json'):
				tempcount = tempcount + 1
				print (tempcount)
				count = count + 1
				continue

			writefile.write(shastringfirst)

			

			tempstats = get_stats(shastringfirst, fullname, language)
			for index in tempstats:
				writefile.write(',')
				writefile.write(str(index))
			writefile.write("\n")
			count = count + 1
		
		i = i + 1



