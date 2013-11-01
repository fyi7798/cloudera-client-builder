cloudera-client-builder
=======================

This is just a quick and dirty dependency gatherer for Hive-JDBC clients,Apache Pig, Hadoop Map Reduce and Hadoop HDFS. If you are just looking for the dependencies just use the appropriate zip file.


In order to run just type ./buildClientZips.sh from a Linux or Mac system.  


This is just a quick and dirty dependency gatherer for Hive-JDB clients,Apache Pig, Hadoop Map Reduce and Hadoop HDFS.

The program requires that maven be installed and of course working. It uses maven to do a dependency analysis and download all the jars to run.


versions.txt

Format:

zip-prefix cdh-version hive-version pig-version


