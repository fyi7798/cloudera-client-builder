while read line
do
    versions=($line)
     mvn clean install -Dcdh.version=${versions[1]} -Dmr.version=${versions[2]} -Dhive.version=${versions[3]}
     zip -j ${versions[0]}.zip target/lib/*
done <versions.txt
