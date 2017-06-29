## Support for MySQL

I wanted to be able to use this database library on a locally hosted MySQL server, so I added some scripts to support this.  Advantages include:

- Avoiding that annoying Azure firewall 
- Database is accessible when disconnected from the internet
- Local server is much faster than the cloud, especially for large views
- Allows customization of the DB if needed (additional fields, alternative LibraryRef, etc)
- Archiving the DB as a CSV file can allow easier source control, simple diffs, quick edits, etc. 

## Installation
First we'll install the server and database, then Altium's DBLib.

#### MySQL Server and Database

- Install MySQL server on Windows and start it running.  We'll assume it's not being used for anything else.

  1) Download and install the 32-bit MySQL MSI installer mysql-installer-web-community-5.7.18.1 from https://dev.mysql.com/downloads/windows/installer/  
     Install the server, the 32-bit ODBC connector and the utilities. (Altium cannot use the 64-bit ODBC version).  
     Create only a root user and select a password.  Configure it to run the server as a service.    
     
  2) Make a tweak to work around a length too long error:  
     First open Task Manager -> Services -> Services button. Then select MySQL service and right-click -> Stop.  
     Edit the file C:\ProgramData\MySQL\MySQL Server 5.7\my.ini and add this line.  (You might have to change permissions on the file first, so you can edit it.) 
     ```
     innodb_strict_mode=0
     ```
     Also try changing these for performance reasons:
     ```     
     key_buffer_size=64M
     innodb_flush_log_at_trx_commit=0
     innodb_buffer_pool_size=800M  
     ```         
     Restart the MySQL service.
  3) Install python 2.7.  https://www.python.org/downloads/windows/
  4) Add these to your Path environment variable.  (Start button -> search "Environment" -> Edit the system Environment variables -> Environment Variables)
      ```
      C:\Python27\;C:\Program Files\MySQL\MySQL Server 5.7\bin\
      ```
  5) Install TortoiseGit https://tortoisegit.org/download/
  6) Clone the repository https://github.com/bkuschak/altium-library.git into c:\altium-library.  
     Check out the bk_mysql branch.
  7) Open a terminal, and run this one time to create the accounts.    
     ```
     cd C:\altium-library\DB\altium-library
     create_user_accounts.bat
     ```     
  8) Obtain a copy of the full Celestial database:  
    - You can unzip the one in the Git project (dbo.Components_XXXXXXXX_XXXX.csv.zip)  
    - Or grab it from Azure. I used a free account on http://www.skyvia.com.  Export the dbo.Component database to a UTF-8 CSV file. 
  9) If necessary, edit convert_mysql.py and change the name fname_db_csv to match the file you downloaded.  
     Then run the import script which converts the CSV file to MySQL format and imports it into the database.
     ```
     python convert_mysql.py
     ```
  If this completed successfully, then everytime windows boots up, a MySQL server instance will start, and will make your components available. Altium will grab these from localhost.  (FIXME - for security should we ensure the DB is only accessible on localhost)

  In the future when you want to recreate/update the DB, just re-run 'python convert_mysql.py'.

#### Altium 
- Be sure you've installed the 32-bit MySQL ODBC connector. (Also available here: https://dev.mysql.com/downloads/connector/odbc/ )
- In Altium, open the file C:/altium-library/CLDB.DbLib.  It should have everything already configured.  But if you want, you can verify it:
  - Check the Connection String. Verify the driver name matches the version you installed above. For example: 

    ```
    Provider=MSDASQL.1;Password=altium;Persist Security Info=True;User ID=altium;Extended Properties="Provider=MSDASQL;Driver={MySQL ODBC 5.3 ANSI Driver};Server=127.0.0.1;Database=altium;Uid=altium;Option=3;"
    ```

  - Click Advanced -> Quote Tables.  Make sure both left and right characters are set to backtick (`)
  
- Click Connect.  After a few seconds, the table list on the left should show many component types. Table browser below should list each component.
  - For all the tables, make sure the Single Key Lookup is set to PartId = PartId.
- In Altium Libraries panel, Install the CLDB.DbLib file.  If everything is working, you should see a whole bunch of libraries.  Clicking on each one of them should show you the symbol, footprint, and supplier information from Digikey, etc.

A few strange things:

- Search box doesn't seem to work for this database lib. Very annoying. Not sure why. 
- Running MySQL on Windows, it takes Altium about 17 seconds to initialize the database, even with the performance tweaks.  With MySQL running on MacOS (and Windows in a VM), it only takes 11 seconds.
- Note: the 'relative path' used in [Library Path] is not relative to the search paths. It is relative to the location of the DBLib file.


## Workflow
I forked this project from issus/altium-library.  I'd like to have my own version, so I can customize the components as needed.  One important thing is to avoid conflict with the PartId, which must be unique, and once selected, should never be changed in the future. 

This is general workflow I plan to follow.  I'll might have to tweak this later, depending on how things go..  

1) Fork Celestial git repo, such as bkuschak/altium-library.  Check out a local copy:
   ```
   git clone bkuschak@github.com:bkuschak/altium-library.git
   cd altium-library
   ```

2) Create an upstream remote to track the original repo.
   ```
   git remote add upstream git://github.com/issus/altium-library.git
   ```

3) Keep all development on a branch, and keep master branch in sync with the upstream master.
   Now, periodically, we want to sync the forked repo with the upstream master:
   ```
   git fetch upstream
   git checkout master
   git pull upstream master
   git push
   ```

4) Then switch back to our branch to do our work.  We'll keep master pristine. (Maybe the only thing I'll add to master is the CSV dump from Azure, ideally at the same time as fetching the upstream master.)
   ```
   git checkout bk_mysql
   ```
   
When adding new components:  

1) Create/modify Altium files and git add them.
2) Edit the CSV files and add new componetns to the end.  I will pick unused PartIDs in a range that won't conflict with Celestial usage (say > 1000000?)
3) Re-run `python convert_mysql.py` to rebuild the database.
4) Git commit and push.

When pulling new changes from upstream master:  

1) git rebase from upstream master repo.
2) Export from the Azure database into CSV files.  Merge those with my files.  This will require some scripts.  A simple diff won't work. (I see the PartID order changes in subsequent Azure exports.)
3) Git commit CVS to my repo.
4) Re-run `python convert_mysql.py` to rebuild the database.  


#### Customizations

Some customizations I can envision:  

- Add support for assembly top/bottom layers with outline and .Designator
- Use the library splitter wizard to generate separate files for each symbol and footprint.  This results in many more files, but simplifies collaborative workflows by avoiding merge conflicts when multiple people add to the library at the same time.
- Possible changes to some component symbols as a matter of personal preference.  (I wish Altium would support LibraryRef1, LibraryRef2, like they do with FootprintRef1, FootprintRef2, ...)


#### Fixme
To improve performance add these indexes to the table.  This improved Altium updates when it was searching for non-existant footprints (from a local component library that was hitting the DbLib during a PCB ECO) - packet rate increased from 75 pps to 4800 pps.

ALTER TABLE Components ADD INDEX covering_index1 (`FootprintRef`);
ALTER TABLE Components ADD INDEX covering_index2 (`FootprintRef2`);
ALTER TABLE Components ADD INDEX covering_index3 (`FootprintRef3`);
