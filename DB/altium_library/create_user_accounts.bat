rem For Windows
rem Create MySQL credentials for 'altium' user, both local and remote
rem (Need to escape percent signs % below)

@echo off
@echo DROP USER IF EXISTS 'altium'@''; > .create_users
@echo DROP USER IF EXISTS 'altium'@'localhost'; >> .create_users
@echo DROP USER IF EXISTS 'altium'@'%%'; >> .create_users
@echo CREATE USER 'altium'@'localhost' IDENTIFIED BY 'altium'; >> .create_users
@echo CREATE USER 'altium'@'%%' IDENTIFIED BY 'altium'; >> .create_users
@echo GRANT ALL PRIVILEGES ON *.* TO 'altium'@'localhost' WITH GRANT OPTION; >> .create_users
@echo GRANT ALL PRIVILEGES ON *.* TO 'altium'@'%%' WITH GRANT OPTION; >> .create_users
@echo GRANT ALL ON *.* to altium@localhost IDENTIFIED BY 'altium'; >> .create_users
@echo GRANT ALL ON *.* to altium@'%%' IDENTIFIED BY 'altium'; >> .create_users
@echo SELECT User,Host from mysql.user; >> .create_users

@echo Creating altium user.  Displaying all users:
@echo ------
mysql.exe -u root -p < .create_users
@echo ------
@echo Done
rem del .create_users

