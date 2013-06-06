vhost-bat
=========

Creating a virtualhost in Windows environment is a hassle.  One has to edit various files, create folders and so on.  In order to automate some of this I decided to come up with a .bat file that resolves some of these problems by automating the process of creating.

The file once done is supposed to the following things:

  1.  Check from the specified folder path (hard coded for now) if there exists a folder with the site name
        - if the folder does exists then inform the user of it and go back to prompting for sitename
        - else create the folder and move to the next step
  2.  Add the virtualhost specs to the httpd.conf file
  3.  Add the sitename to hosts - file
  4.  Create an index page for the site with simple content


  
      
