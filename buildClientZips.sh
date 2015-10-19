#!/bin/bash

mvn clean install

#need to get these specific test and source files

PARQUETFORMATVERSION="2.1.0-cdh5.4.5"
HADOOPVERSION="2.6.0-cdh5.4.5"
SCALAVERSION="2.10"
SPARKVERSION=1.3.0-cdh5.4.5

cd target/lib

# need to rename file since this is how it is set in Spark.pom file and appears on CDH cluster
#https://maven-repository.com/artifact/org.apache.spark/spark-network-yarn_2.10/1.3.0-cdh5.4.5/pom

mv spark-network-shuffle_$SCALAVERSION-$SPARKVERSION.jar spark-$SPARKVERSION-yarn-shuffle.jar

# get the Spark files

mkdir spark
cd spark
curl -O http://archive.cloudera.com/cdh5/cdh/5/spark-1.3.0-cdh5.4.5.tar.gz
gzip -dc spark-$SPARKVERSION.tar.gz | tar xvf -
mv spark-$SPARKVERSION/spark-assembly-$SPARKVERSION-hadoop$HADOOPVERSION.jar ../

# back to target/lib
cd ../
pwd

mkdir pig
cd pig
curl -O http://archive.cloudera.com/cdh5/cdh/5/pig-0.12.0-cdh5.4.5.tar.gz
gzip -dc pig-0.12.0-cdh5.4.5.tar.gz | tar xvf -
mv pig-0.12.0-cdh5.4.5/pig*hadoop.jar ../

# back to target/lib
cd ../
curl -o parquet-format-javadoc.jar http://repository.cloudera.com/cloudera/cdh-releases-rcs/com/twitter/parquet-format/$PARQUETFORMATVERSION/parquet-format-$PARQUETFORMATVERSION-javadoc.jar
curl -o parquet-format-sources.jar http://repository.cloudera.com/cloudera/cdh-releases-rcs/com/twitter/parquet-format/$$PARQUETFORMATVERSION/parquet-format-$$PARQUETFORMATVERSION-sources.jar
curl -O http://repository.cloudera.com/cloudera/cdh-releases-rcs/org/apache/hadoop/hadoop-common/$HADOOPVERSION/hadoop-common-$HADOOPVERSION-tests.jar

# need to rename the parquet files so they don't have extensions on them
ls parquet* | sed -e 'p;s/-1.5.0-cdh5.4.5//' | xargs -n2 mv

#parquet format has different version
ls parquet* | sed -e 'p;s/-2.1.0-cdh5.4.5//' | xargs -n2 mv

# back to root directory
cd ../..

while read line
do
    versions=($line)
    zip -j jarFiles.zip target/lib/$line
done <versions.txt