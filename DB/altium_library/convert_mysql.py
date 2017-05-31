# For use with the Celestial Altium Database.  
# Rather than using the Azure cloud database, use a (local) MySQL server.  Why?
# 
# - DB is usable when not connected to the internet
# - local server is much faster than the cloud, especially for large views
# - allows customization of the DB if needed (additional fields, alternative LibraryRef, etc)
# - archiving the DB as a CSV file can allow easier source control, simple diffs, quick edits, etc. 
# 
# Input: a single CSV file containing all the components and .sql files defining the views.
# Convert the CSV and view syntax into a single MySQL file and import into a MySQL database.
#
# If this is to be used by a single user, then CSV management is easy.  If used by a larger group,
# it would be better to manage DB through a MySQL front-end, and then periodically export
# to CSV if desired.  Re-run this script to recreate the DB whenever the CSV file changes.
#
# WARNING: running this script will DELETE the existing MySQL 'Altium' DB, so be careful!!
#
# First, need to get the Celestial DB in CSV format.  Easiest way seems to be using a free
# account at https://skyvia.com/ to export the 'dbo.Components' table to a CSV file.  (You'll
# need to request login credentials from the DB owner first.)  The view creation is done based on
# the .sql files in the git project.
#
# Type: SQL Server
# Server: csql.database.windows.net
# User ID: xxxxxx@csql
# Password: xxxxxxxxx
# Database: altium_library
#
# Important considerations:
# - The PartID fields and view names for existing components should NEVER change, or it will 
#   break every schematic that currently uses them.  
# - In my tests, a 28k+ item DB uses only 20 MB for the mysql process.
#
# Brian Kuschak <bkuschak@yahoo.com>, 4/23/17
#

import csv
import codecs
import re
import sys
import glob
import os

dbname = 'altium'					# MYSQL DB name
fname_sql = dbname + '.mysql'				# output filename
pathname_views='Views/*.sql'				# input: the Celestial View definitions
fname_db_csv = 'dbo.Components_20170422_0353.csv'	# downloaded from Skyvia

fsql = 0

# This seems to be needed to convert each cell from UTF-8 to unicode
def unicode_csv_reader(utf8_data, dialect=csv.excel, **kwargs):
    csv_reader = csv.reader(utf8_data, dialect=dialect, **kwargs)
    for row in csv_reader:
        yield [unicode(cell, 'utf-8') for cell in row]


def init_db(fname_sql):
	# Create new file for the sql output
	global fsql
	fsql = codecs.open(fname_sql, 'wt', encoding='utf8')

	# Remove database if it exists
	print >>fsql, "DROP DATABASE IF EXISTS %s;" % (dbname)
	print >>fsql, "CREATE DATABASE %s;" % (dbname)
	print >>fsql, "USE %s;\n" % (dbname)


# Given a CSV filename, create a SQL table containing the same info
def process_csv(filename, tablename):
	print "Reading '%s' input file..." % (filename)
	with open(filename, 'rb') as f:

		# Hack, what is the right way to deal with this?  CSV includes a UTF-8 BOM character as the first
		# character to indicate this file is UTF-8 encoded.  Although csv module is supposed to deal with UTF8
		# it is causing problems.  See if we can discard it...
		# ZERO WIDTH NO-BREAK SPACE
		utf8_bom = f.read(3)
		if utf8_bom != '\xef\xbb\xbf':
			f.rewind()
		startpos = f.tell()

		# Need to use this new method, otherwise the for below fails as it tries to convert from ascii not unicode...
		reader = unicode_csv_reader(f)

		# Remove table if it already exists
		print >>fsql, "DROP TABLE IF EXISTS %s;" % (tablename)

		# Then iterate over the input file and create the sql output
		for i, row in enumerate(reader):

			if i == 0:
				# Process the first row header by creating a table
				print >>fsql, "CREATE TABLE %s (" % (tablename)

				# We will assume all fields are textual except for the ID which is an integer
				# Use 128 for max length: the memory used by MySQL will only be as much as needed
				for j, col in enumerate(row):
					if col == 'PartId':
						print >>fsql, "    `%s` INT(11) PRIMARY KEY," % (col)
					else:
						if j == len(row)-1:
							print >>fsql, "    `%s` VARCHAR(128)" % (col)
						else:
							print >>fsql, "    `%s` VARCHAR(128)," % (col)
				print >>fsql, ");\n" 
			else:
				# Process the next row by adding it to the database
				print >>fsql, "INSERT INTO %s VALUES (" % (tablename)
				str = ''
				for j, col in enumerate(row):
					if j == len(row)-1:
						str = str + '\'' + col + '\''
					else:
						str = str + '\'' + col + '\' , '
				str = str + ');\n'
				print >>fsql, str

	# return number of rows processed
	return i

# Celestial defines a database view for each type of component.  But their syntax is for Azure. Convert these to MySQL syntax.
def create_views(filename):
	with open(fname, 'rb') as f:
		# Hack, what is the right way to deal with this?  CSV includes a UTF-8 BOM as the first
		# character to indicate this file is UTF-8 encoded.  Although csv module is supposed to deal with UTF8
		# it is causing problems.  See if we can discard it...
		# ZERO WIDTH NO-BREAK SPACE
		utf8_bom = f.read(3)
		if utf8_bom != '\xef\xbb\xbf':
			f.rewind()
		
		# Syntax conversion to MySQL
		for line in f:
			line = line.replace('[dbo].', '') 
			line = line.replace('dbo.', '') 
			line = line.replace('TOP (100) PERCENT', '') 
			line = line.replace('CREATE VIEW', 'CREATE OR REPLACE VIEW') 
			line = line.replace('[', '`') 
			line = line.replace(']', '`') 
			line = line.replace('GO', '') 
			line = re.sub('\s*$', '', line) 	# trailing whitespace
			line = re.sub('^\s*', '', line) 	# leading whitespace
			line = re.sub(', ', ',\n', line) 	# break lines after commas
			print >>fsql, line
		print >>fsql, ';\n'



# Take the file we just created and import it into a (local?) mysql instance
def import_mysql():
	print "Importing into mysql..."
	os.system('mysql5 -u root < %s' % (fname_sql))		# FIXME allow username selection


# 
nrows = 0
init_db(fname_sql)

# Process the CSV file containing all the components. Use the same name as Celestial DB
nrows = nrows + process_csv(fname_db_csv, 'Components')

# Convert the view syntax from MSSQL to MySQL
print "Creating views..."
for fname in glob.glob(pathname_views):
	create_views(fname)

import_mysql()

print "Imported %d components\n" % (nrows)

