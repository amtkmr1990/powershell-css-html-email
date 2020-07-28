<#

This script can be used when you want to css and HTML format in powershell email sending 
This script input the xml table format and covert it to HTML file for sending email notification
#>

$xml = "intput_the_xml_file.xml"

$xsl = "Notification-Transformer.xslt" 

$output = "Output_Notificaiton_file_for_email.html"

if (-not $xml -or -not $xsl -or -not $output)
{
	Write-Host "& .\xslt.ps1 [-xml] xml-input [-xsl] xsl-input [-output] transform-output"
	exit;
}

trap [Exception]
{
	Write-Host $_.Exception;
}

$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.Load($xsl);
$xslt.Transform($xml, $output);

Write-Host "generated" $output;

$xmlContext = New-Object System.Xml.XmlDocument;

$xmlContext.Load($xml)

$DataCenterName = $xmlContext.SelectSingleNode("/root/row/Datacenter").InnerText;
$ClusterName = $xmlContext.SelectSingleNode("/root/row/Cluster").InnerText;
$ESXiHostName = $xmlContext.SelectSingleNode("/root/row/SrcHost").InnerText;
$ESXiHostName = $ESXiHostName.Split(".")[0];


### CODE TO SEND E-MAIL CONTENT ##

$emailBody = Get-Content -Path $output 


Send-MailMessage -BodyAsHtml -Body $emailBody -Subject $subject 