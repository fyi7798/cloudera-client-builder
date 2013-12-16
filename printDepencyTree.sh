while read line
do
    versions=($line)
     mvn dependency:resolve  -Dcdh.version=${versions[1]} -Dmr.version=${versions[2]} -Dhive.version=${versions[3]}  -Dpig.version=${versions[4]}|grep runtime |awk '{print $2}'| awk 'BEGIN { FS = ":" };{gsub("\\.","/",$1)} ; { print $1"/"$2"/"$4"/"$2"-"$4"."$3 }'>${versions[1]}.txt
done <versions.txt
