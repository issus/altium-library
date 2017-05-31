## Support for MySQL

I wanted to be able to use this database library on a locally hosted MySQL server, so I added some scripts to support this.  Advantages include:

- Avoiding that annoying Azure firewall 
- Database is accessible when disconnected from the internet
- Local server is much faster than the cloud, especially for large views
- Allows customization of the DB if needed (additional fields, alternative LibraryRef, etc)
- Archiving the DB as a CSV file can allow easier source control, simple diffs, quick edits, etc. 

## Installation

- Install MySQL server and start it running.  We'll assume it's not being used for anything else.
 - On MacOS this can be done like this:

  `sudo port install mysql5-server`
  `sudo -u _mysql mysql_install_db5`
  `sudo port load mysql5-server`

- Obtain a copy of the full Celetial database and export it as CSV format (with UTF-8 encoding).
  - I used a free account on http://www.skyvia.com.  Export the dbo.Component database to a UTF-8 CSV file.
- Then use the scripts below to import it to a locally running MySQL database. 
  `python convert_mysql.py <FIXME CSV filename>`
  `./create_mysql_users.sh`

A few things need to be set up in Windows to use this with Altium:

- Download and install the 32-bit MySQL ODBC connector: https://dev.mysql.com/downloads/connector/odbc/
- In Altium, open the DbLib file and click the Connection String -> Build button. Verify the driver name matches the version you installed above. For example: FIXME - use localhost

  - `Provider=MSDASQL.1;Password=altium;Persist Security Info=True;User ID=altium;Extended Properties="Provider=MSDASQL;Driver={MySQL ODBC 5.3 ANSI Driver};Server=10.211.55.2;Database=altium;Uid=altium;Option=3;"`

- Click Advanced -> Quote Tables.  Make sure both left and right characters are set to backtick (`)
- Click Connect.  Table list on the left should show lots of component types. Table browser below should list each component.
- For all the tables, make sure the Single Key Lookup is set to PartId = PartId.
- In Altium Libraries panel, Install the CLDB.DbLib file.  If everything is working, you should see a whole bunch of libraries.  Clicking on each one of them should show you the symbol, footprint, and supplier information from Digikey, etc.

A few strange things:

- Search box doesn't seem to work for this database lib.  Not sure why. 
- Note: the 'relative path' used in [Library Path] is not relative to the search paths. It is relative to the location of the DBLib file.
