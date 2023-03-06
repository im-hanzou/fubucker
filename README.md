# Fubucker | CVE-2022-1386 - Fusion Builder
Automatic Mass Tool for checking vulnerability in CVE-2022-1386 - Fusion Builder < 3.6.2 - Unauthenticated SSRF<br>Using GNU Parallel. You must have parallel for running this tool<br><b>If you found error like '$'\r': command not found' just do 'dos2unix fubucker.sh'</b>
# Install Parallel
Linux : <br>
<b>command</b> <br># <i>apt-get install parallel -y</i><br>
Windows : <br>
You can install WSL (windows subsystem linux) then do install like linux<br>if you want use windows, install <a href="https://git-scm.com/download/win">GitBash</a><br>
<b>command</b> <br># <i>curl pi.dk/3/ > install.sh <br># sha1sum install.sh | grep 12345678 <br># md5sum install.sh <br># sha512sum install.sh <br># bash install.sh</i><br>
# How To Use
<i>bash fubucker.sh yourlist.txt thread</i>
# Reference
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1386<br>
https://wpscan.com/vulnerability/bf7034ab-24c4-461f-a709-3f73988b536b<br>
https://github.com/projectdiscovery/nuclei-templates/issues/4892<br>
https://github.com/ardzz/CVE-2022-1386<br>
