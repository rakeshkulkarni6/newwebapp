$destination = "$ENV:temp"
$source = "https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe";
$Nameofvcredist='Microsoft Visual C++ 2010  x86 Redistributable - 10.0.30319'

#Check if software is installed. If installed terminate script
   $installedsoftwares=Get-WmiObject -Class win32_product | Select-Object -Property Name | Where-Object {$_.Name -match "10.0.30319"}  

    if( $Nameofvcredist -eq $installedsoftwares.name)
    {
        write-host("Error: The $Nameofvcredist is already Installed")

    }


#Check if the installer is in the folder. If installer exist, replace it
 
    elseIf ((Test-Path "$destination\vcredist_x86.exe") -eq $false)
        {
            New-Item -ItemType File -Path "$destination\vcredist_x86.exe" -Force
         #install software
            Invoke-WebRequest $source -OutFile "$destination\vcredist_x86.exe"
            start-process -FilePath "$destination\vcredist_x86.exe" -ArgumentList '/q','/i' -Wait
            $installedsoftwares=Get-WmiObject -Class win32_product | Select-Object -Property Name | Where-Object {$_.Name -match "10.0.30319"}  

                if( $Nameofvcredist -eq $installedsoftwares.name)
                {
                    write-host(" The $Nameofvcredist is Installed")
                }
    
        #Delete installer
            Remove-Item -recurse "$destination\vcredist_x86.exe"
         } 



$source = "http://www.alpha-bit.de/index.php/en/downloadside-e/category/19-ms-redistributables?download=769:microsoft-redistributables";


#Check if software is installed. If installed terminate script
$VS2010_vcredist='Microsoft Visual C++ 2013  x86 Redistributable - 12.0.21005'

#Check if software is installed. If installed terminate script
   $installedsoftwares=Get-WmiObject -Class win32_product | Select-Object -Property Name | Where-Object {$_.Name -match "12.0.21005"}  

    if( $VS2010_vcredist -eq $installedsoftwares.name)
    {
        write-host("Error: The $VS2010_vcredist is already Installed")
    }


#Check if the installer is in the folder. If installer exist, replace it
 
    elseIf ((Test-Path "$destination\VS2010_vcredist_x86.exe") -eq $false) 
        {
         New-Item -ItemType File -Path "$destination\VS2010_vcredist_x86.exe" -Force
         #install software

        Invoke-WebRequest $source -OutFile "$destination\VS2010_vcredist_x86.exe"
        start-process -FilePath "$destination\VS2010_vcredist_x86.exe" -ArgumentList '/q','/i' -Wait
         $installedsoftwares=Get-WmiObject -Class win32_product | Select-Object -Property Name | Where-Object {$_.Name -match "12.0.21005"}  

            if( $VS2010_vcredist -eq $installedsoftwares.name)
            {
                write-host(" The $VS2010_vcredist is Installed")
            }
                #Delete installer

        Remove-Item -recurse "$destination\VS2010_vcredist_x86.exe"
    } 





#Check if software is installed. If installed terminate script
$source = "https://download.microsoft.com/download/5/4/6/5462bcbd-e738-45fa-84ca-fa02b0c4e1c2/ASPAJAXExtSetup.msi";
$NameofASPAJAX='Microsoft ASP.NET 2.0 AJAX Extensions 1.0'
$installedsoftwares=Get-WmiObject -Class win32_product | Select-Object -Property Name | Where-Object {$_.Name -match "AJAX Extensions"}
    if ($NameofASPAJAX -eq $NameofASPAJAX.Name)
    {
        write-host ("Error: The $NameofASPAJAX is already Installed")

    }

    #Check if the installer is in the folder. If installer exist, replace it
 
    If ((Test-Path "$destination\ASPAJAXExtSetup.msi") -eq $false) 
    {
        New-Item -ItemType File -Path "$destination\ASPAJAXExtSetup.msi" -Force
#Install The Software

        Invoke-WebRequest -uri $source -OutFile "$destination\ASPAJAXExtSetup.msi"
		Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList "/i","$destination\ASPAJAXExtSetup.msi", "/qn" -wait
        $installedsoftwares=Get-WmiObject -Class win32_product | Select-Object -Property Name | Where-Object {$_.Name -match "AJAX Extensions"}
            if ($NameofASPAJAX -eq $NameofASPAJAX.Name)
            {
                write-host ("The $NameofASPAJAX is Installed")
                exit
            }
        
#Delete installer
        Remove-Item -recurse "$destination\ASPAJAXExtSetup.msi"
    } 



                

