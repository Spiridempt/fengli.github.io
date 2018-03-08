import os

'''The path of csv files of each project'''
basicpath = 'D:\\CrawlData\\results\\'

thislanguage = 'PHP'

def get_dic_sha_totalchange(category, projectname):
	proresultpath = '/home/seitest/PLstudy/' + category + '/' + projectname + '.csv'
	readfile = open(proresultpath)
	totallines = readfile.readlines()
	dicshachange = {}
	for eachline in totallines:
		# print eachline
		splits = eachline.split(',')
		if len(splits) == 11:
			shastring =  splits[0]
			changeloc = splits[8]
			changemessage = splits[5]

			if 'fix' in changemessage or '#' in changemessage or 'Normal' in changemessage:
				if changeloc>0:
					dicshachange[shastring] = float(changeloc)

	readfile.close()
	return dicshachange


def get_dic_sha_totalchange_issue(category, projectname):

	proresultpath = '/home/seitest/PLstudy/' + category + '/' + projectname + '.csv'
	readfile = open(proresultpath)
	totallines = readfile.readlines()
	dicshachange = {}
	for eachline in totallines:
		# print eachline
		splits = eachline.split(',')
		if len(splits) == 11:
			shastring =  splits[0]
			changeloc = splits[8]
			changemessage = splits[6]
			if 'ISSUE' in changemessage:
				if changeloc>0:
					dicshachange[shastring] = float(changeloc)

	readfile.close()
	return dicshachange


def get_dic_sha_totalchange_bug(category, projectname):

	proresultpath = '/home/seitest/PLstudy/' + category + '/' + projectname + '.csv'
	readfile = open(proresultpath)
	totallines = readfile.readlines()
	dicshachange = {}
	for eachline in totallines:
		# print eachline
		splits = eachline.split(',')
		if len(splits) == 11:
			shastring =  splits[0]
			changeloc = int(splits[8])
			changemessage = splits[7]
			if 'BUG' in changemessage:
				if changeloc>0:
					dicshachange[shastring] = float(changeloc)

	readfile.close()
	return dicshachange



def get_loc(category, projectname):

	proresultpath = '/home/seitest/PLstudy/' + category + '/' + projectname + '.csv'
	readfile = open(proresultpath)
	totallines = readfile.readlines()
	loc = 0;
	for eachline in totallines:
		# print eachline
		splits = eachline.split(',')
		if len(splits) == 8:
			loc = splits[6]

	readfile.close()
	return loc





def get_medium_value(dic):
#	print dic

	data = []
	for i in dic:
		data.append(dic[i])
	data = sorted(data)
	size = len(data)
	if size != 0:
		if size % 2 == 0: 
			median = (data[size//2]+data[size//2-1])/2
			data[0] = median
		if size % 2 == 1: 
			median = data[(size-1)//2]
			data[0] = median
		return data[0]
	else:
		return -1

def get_domain():

	dic_pro_domain = {}
	readfile = open('D:\\total_category.txt')
	totallines = readfile.readlines()
	for eachline in totallines:
		eachline = eachline.strip()
		namefirst = eachline.split(' ')[0]
		namesecond = eachline.split(' ')[1]
		domain = eachline.split(' ')[2]
		dic_pro_domain[namefirst+'-'+namesecond] = domain
	readfile.close()

	return dic_pro_domain

def get_language():

	dic_pro_lang = {}
	readfile = open('D:\\total_category_with_language.txt')
	totallines = readfile.readlines()
	for eachline in totallines:
		eachline = eachline.strip()
		namefirst = eachline.split(' ')[0]
		namesecond = eachline.split(' ')[1]
		lang = eachline.split(' ')[3]
		dic_pro_lang[namefirst+'-'+namesecond] = lang
	readfile.close()

	return dic_pro_lang

def get_totalloc():

	dic_pro_loc = {}
	readfile = open('D:\\result_loc.txt')
	totallines = readfile.readlines()
	for eachline in totallines:
		eachline = eachline.strip()
		namefirst = eachline.split(' ')[0]
		namesecond = eachline.split(' ')[1]
		loc = eachline.split(' ')[2]
		dic_pro_loc[namefirst+'-'+namesecond] = loc
	readfile.close()

	return dic_pro_loc

def get_totalcommits(category, projectname):
	filenames = os.listdir('/home/seitest/PLstudy/'+category+'/'+projectname+'/commits')
	return str(len(filenames)).strip('\n')




def mainmethod():

	writepath = '/home/seitest/PLstudy/results/diffdom-test-php.csv'
	writefile = open(writepath,'w')
	writefile.write('projectname,medium,medium-issue,medium-bug,changepro,changepro-issue,changepro-bug,language,totalcommits,sloc\n')

#	dic_pro_domain = get_domain()
#	dic_pro_lang = get_language()
#	dic_pro_loc = get_totalloc()


	sloc_results_file = open('/home/seitest/cloc_php.csv')
	alllines = sloc_results_file.readlines()
	sloc_dict = {}
	for eachline in alllines:
		eachline = eachline.strip()
		stringfirst = eachline.split(',')[0]
		stringsecond = eachline.split(',')[1]
#		print eachline.strip(',')
#		print stringfirst
#		print stringsecond
		sloc_dict[stringfirst] = stringsecond






	totalprojectsfile = open('/home/seitest/php60.txt')
	i = 0
	while(i < 60):
		line = totalprojectsfile.readline()
		if(i==-1):
			i = i + 1
			continue
		data = line.split(' ')
#		category = data[0]
		first = data[0]
		second = data[1].strip()
#		language = data[3].strip('\n')
		fullname = first + '-' + second

#		fullname = 'nwjs-nw.js'

#	for eachpro in totalfiles:
		print 'writing project: ',fullname
#		eachpro = eachpro.replace('.csv','')
		dic = get_dic_sha_totalchange(thislanguage, first + '-' + second)
		medium = get_medium_value(dic)


		dic_issue = get_dic_sha_totalchange_issue(thislanguage, first + '-' + second)
		medium_issue = get_medium_value(dic_issue)

		dic_bug = get_dic_sha_totalchange_bug(thislanguage, first + '-' + second)
		medium_bug = get_medium_value(dic_bug)
#		print (dic_bug)
#		get_dic_sha_totalchange_onlyfix


#		domain = category
#		lang = language



#		loc = float(get_loc(category, first + '-' + second))
#		loc = int(sloc_dict[second])
#		print second
		loc = sloc_dict.get(second)
		if(loc == 'null' or loc is None):
			loc = 0
		else:
			loc = int(loc)

#		print sloc_dict.get('rrule')



		if(loc == 0):
			changepro = -1
			changepro_issue = -1
			changepro_bug = -1
		else:
			changepro = medium/float(loc)
			changepro_issue = medium_issue/float(loc)
			changepro_bug = medium_bug/float(loc)

		totalcommits = get_totalcommits(thislanguage, first + '-' + second)

		writefile.write(fullname+','+str(medium)+','+str(medium_issue)+','+str(medium_bug)+','+str(changepro)+','+str(changepro_issue)+','+str(changepro_bug)+','+thislanguage+','+str(totalcommits).strip()+','+str(loc)+'\n')

		i = i + 1

	writefile.close()

mainmethod()


