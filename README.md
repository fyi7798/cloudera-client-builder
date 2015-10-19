cloudera-client-builder
=======================

This project has been forked from https://github.com/woodychristy/cloudera-client-builder.

This is just a quick and dirty dependency gatherer for all the jar files mentioned in the Maven pom.xml.
The files mentioned in the versions.txt file are provided by a customer and are needed in order to run the application.


In order to run just type ./buildClientZips.sh from a Linux or Mac system.  

The program requires that maven be installed and of course working. It uses maven to do a dependency analysis and download all the jars to run.

versions.txt --> list of jars that will be included in the final output .zip file



