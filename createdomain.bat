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
(
echo ###%sitename%### 
echo	^<VirtualHost *:80^> 
echo		ServerAdmin admin@%sitename% 
echo		DocumentRoot "%BASEURL%%sitename%" 
echo		ServerName %sitename%.dev 
echo    	ServerAlias %sitename%.dev 
echo		^<Directory "%BASEURL%%sitename%"^> 
echo			Options Indexes FollowSymLinks Includes ExecCGI 
echo			Order allow,deny 
echo			Allow from all 
echo		^</Directory^> 
echo	^</VirtualHost^> 
) >>D:\web\xampp\apache\conf\extra\httpd-vhostsTest.conf

echo Updating hosts
echo  127.0.0.1	%sitename%.dev  >>C:\Windows\System32\Drivers\etc

echo Restarting apache
httpd -k restart

