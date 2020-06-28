send_email()
{
email_body=$1
email_status=$2
email_attachement=$3 #optional
email_subject="Project run is ${email_status}"

echo -e "${email_body}" | mailx ${email_attachement} -s "${email_subject}" -r "${sender}" "${recipient}"
}
#call send_email
send_email "This is sample email" "Success" 
send_email "This is email with attachement" "success" "/home/email_template.txt"



sample csv file (list.csv)
-------------------
id,name
1,'Mary'

#sending an email with table format of csv file

(
echo "From: ${sender}"
echo "To ${receiver}"
echo "subject: report"
echo "Content-Type:text/html"
echo "<html>"
echo "<style>"
echo "table {border-collapse:collapse;width:100%;}"
echo "th {padding: 4px;text-align:left;border-bottom:1px solid#ddd;background-color:#94E1F7;}"
echo "td {padding:4px;text-align:left;}"
echo "tr:nth-child(even) {background-color:#f2f2f2;} </style>"
echo "</body>"
echo "<p><font face="Arial" size="2"> Hii All,"
echo "<br> </br>"
echo "<table style=\"width:100%\" border=\"1\">"

cnt=0
while read line
do
 if [ $count -eq 0 ]; then
 	echo "<tr><th>"
 	echo $line | sed 's/,/<\/th><th>/g'
 	echo "</th></tr>"
 	
 	else
 		echo "<tr><td>"
 		echo $line | sed 's/,/<\/td><td>/g'
 		echo "</td></tr>"
 fi
 cnt=$((cnt+1))
done < "/home/list.csv"

echo "</table>"
echo <br><br>

echo "</body></html>"
) > "/home/email_template.txt"

