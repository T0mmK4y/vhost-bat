@ECHO OFF

::location of vhosts
SET BASEURL=D:\web\vhosts\

:sitenameprompt
::ask for a sitename
set /p sitename="Enter Sitename: " %=%

echo Before IF
IF EXIST %BASEURL%%sitename% echo The specified site folder already exists! Choose another. 
IF EXIST %BASEURL%%sitename% goto sitenameprompt 

IF NOT EXIST %BASEURL%%sitename% echo Creating folder 
IF NOT EXIST %BASEURL%%sitename% MD %BASEURL%%sitename%

echo Adding virtualhost to httpd.conf
pause

echo ###%sitename%### >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo	^<VirtualHost *:80^> >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo		ServerAdmin admin@%sitename% >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo		DocumentRoot "%BASEURL%%sitename%" >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo		ServerName %sitename%.dev >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo    	ServerAlias %sitename%.dev >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo		^<Directory "%BASEURL%%sitename%"^> >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo			Options Indexes FollowSymLinks Includes ExecCGI >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo			Order allow,deny >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo			Allow from all >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo		^</Directory^> >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf
echo	^</VirtualHost^> >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf

pause
echo Restarting apache
::httpd -k restart

