Set-ExecutionPolicy RemoteSigned
Install-WindowsFeature Net-Framework-Core -source \sxs;./SharpHound.exe --DomainController ad01 -c ALL;
import-csv "acls.csv" | ConvertTo-Json | Add-Content -Path "acls.json";
import-csv "computer_props.csv" | ConvertTo-Json | Add-Content -Path "computer_props.json";
import-csv "container_gplinks.csv" | ConvertTo-Json | Add-Content -Path "container_gplinks.json";
import-csv "container_structure.csv" | ConvertTo-Json | Add-Content -Path "container_structure.json";
import-csv "group_membership.csv" | ConvertTo-Json | Add-Content -Path "group_membership.json";
import-csv "local_admins.csv" | ConvertTo-Json | Add-Content -Path "local_admins.json";
import-csv "user_props.csv" | ConvertTo-Json | Add-Content -Path "user_props.json";
Compress-Archive -Path "*.json" -CompressionLevel Fastest -DestinationPath "BloodHound_Json_Files.zip";
Remove-Item –path "*.csv";
Remove-Item –path "*.json";
Remove-Item –path "*.bin";

