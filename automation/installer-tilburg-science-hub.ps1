<#
.Synopsis
   This console app has integrated menu and will download various applications and install them
.DESCRIPTION
   The app is separated into functions which upon using an option will trigger. The application will download the selected application upon selecting the option
   and then can install the downloaded application
.EXAMPLE
   N/A
.EXAMPLE
   N/A
.INPUTS
   Optiion selection
   Please be advised that additional variables needs to be defined inside the app such as the AWS configuration variables
   $AWSID = "TEST"
   $AWSPASS = "TEST"
   $AWSREGION = "aws-west-2"
   $AWSOUTPUT = "JSON"
.OUTPUTS
   The application outputs text message to the console upon task task completion
.NOTES
   N/A
.COMPONENT
   Fiverr User Hannesuvt
.ROLE
   Fiverr User Hannesuvt
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>


#Setting variables
$Global:DownloadFolder = $env:TEMP
$GIT_Base_URL ="https://git-scm.com/download/win"
$R_Download_URL = "https://cran.r-project.org/bin/windows/base/R-3.6.3-win.exe"
$AWS_CommandLine = "https://aws.amazon.com/cli/"
$MAKE_URL = "https://sourceforge.net/projects/gnuwin32/files/make/3.81/make-3.81.exe/download?use_mirror=netix&download="
$Anaconda_URL = "https://repo.anaconda.com/archive/Anaconda3-2020.02-Windows-x86_64.exe"
$Chrome_URL = "http://dl.google.com/chrome/install/375.126/chrome_installer.exe"
$Chrome_Drivers_URL = "https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_win32.zip"
$ErrorLogFile = "$Global:DownloadFolder\ErrorLog.txt"
$InfoLogFile = "$Global:DownloadFolder\InfoLogFile.txt"
#AWS Config command variables, Once the AWS CLI is installed using those variables the Install-AWSCLI function will run a set

#Of Invoke-Expressions which will configure your AWS CLI for use
$AWSID = "TEST"
$AWSPASS = "TEST"
$AWSREGION = "aws-west-2"
$AWSOUTPUT = "JSON"

function Get-DwnloadFileSize {
    param (
        [string]
        $URL
    )

$clnt = [System.Net.WebRequest]::Create($URL)
$resp = $clnt.GetResponse()
$fileSize = $resp.ContentLength
$sizeMB = [math]::Round($fileSize / 1MB, 4)
$sizeMB

}

#Function that adds environment variables
function Check_Program_Installed( $programName ) {
    $x86_check = ((Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall") |
    Where-Object { $_."Name" -like "*$programName*" } ).Length -gt 0;

    if(Test-Path 'HKLM:\Software\Wow6432Node\Microsof\tWindows\CurrentVersion\Uninstall')
    {
    $x64_check = ((Get-ChildItem "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
    Where-Object { $_."Name" -like "*$programName*" } ).Length -gt 0;
    }
    return $x86_check -or $x64_check;
    }

function Add-EVNVar {

    $env:Path += ";C:\Program Files\Git\cmd"
    $env:Path += ";C:\Program Files (x86)\GnuWin32\bin"
    $env:Path += ";C:\Program Files\R\R-3.6.3\bin"

}

#This function will check and create a temp folder for the downloads that will also hold any logs
function TempFolderCheck {

    param (
        [string]
        $Folder
    )

    if(!(Test-Path -Path $Folder )){
        New-Item -ItemType directory -Path $Folder
        Write-Host "Temp folder created $Folder"
    }

}

#Execution of the function


#This is a logging function, can bbe used for other means as well
#Example Write-Log -Level INFO -Message "Message or error variable" -LogFile "logfile location"
Function Write-Log
{
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $False)]
        [ValidateSet("INFO", "WARN", "ERROR", "FATAL", "DEBUG")]
        [String]$Level = "INFO",
        [Parameter(Mandatory = $True)]
        [string]$Message,
        [Parameter(Mandatory = $False)]
        [string]$logfile
    )

    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Line = "$Stamp $Level $Message"
    If ($logfile)
    {
        Add-Content $logfile -Value $Line
    }
    Else
    {
        Write-Output $Line
    }
}

  #This function will check for the files and install the GIT-SCM using a start-process, which should work with user rights.
  function Install_GITSCM {

    Write-Host "GIT-SCM installation will start in 2 sec, checking installation files"
    Start-Sleep -Seconds 2
    $check_GITFile = Test-Path -Path "$Global:DownloadFolder\Git*.exe" -ErrorVariable GITFileMissing -ErrorAction SilentlyContinue

    if($check_GITFile -eq $False){

    Write-Host "I was unable to find the file in $Global:DownloadFolder, are you sure the GIT installer is downloaded?"
    Write-Log -Level ERROR -Message "The following error occurerd: $GITFileMissing" -logfile $ErrorLogFile
    Write-Log -Level ERROR -Message "Unable to find GIT-SCM Installation file in $Global:DownloadFolder" -logfile $ErrorLogFile
    }
    Else{
    $filefullpath = Get-ChildItem -Path "$Global:DownloadFolder\Git*.exe" -Recurse | % { $_.FullName }

    Write-Host "$filefullpath"
    }
    Start-Process $filefullpath -ArgumentList "/SILENT" -Wait

    Write-Host "I will add the environmnet variables"
    Add-EVNVar
    $checkinst = Check_Program_Installed("GIT*")
    if($checkinst -eq $true){
        Write-Host "Application found in registry, installed successfully"
    }Else{
        Write-Host "Was unable to discover application files in registry"
    }
    Write-Host "--------------------------------------------------------------------------------------"
    Write-Host "Installation Completed."
    Write-Host "--------------------------------------------------------------------------------------"
   }

   #The R file function is the same, starting a process and silently installing the R application
   function Install_R_File {

    Write-Host "Searching for R fils in Download folder"
    Start-Sleep -Seconds 2
    $check_RFile = Test-Path -Path "$Global:DownloadFolder\R.exe" -ErrorVariable RFileMissing -ErrorAction SilentlyContinue

    if($check_RFile -eq $False)
    {

    Write-Host "I was unable to find the file in $Global:DownloadFolder, are you sure the GIT installer is downloaded?"
    Write-Log -Level ERROR -Message "The following error occurerd: $RFileMissing" -logfile $ErrorLogFile
    Write-Log -Level ERROR -Message "Unable to find R Installation file in $Global:DownloadFolder" -logfile $ErrorLogFile
    }

    Else
    {

    $filefullpath = Get-ChildItem "$Global:DownloadFolder\R.exe" -Recurse | % { $_.FullName }

    }
    Start-Process $filefullpath -ArgumentList "/SILENT" -Wait

    Write-Host "I will add the environmnet variables"
    Add-EVNVar
    $checkinst = Check_Program_Installed("R")
    if($checkinst -eq $true){
        Write-Host "Application found in registry, installed successfully"
    }Else{
        Write-Host "Was unable to discover application files in registry"
    }

    Write-Host -Message "--------------------------------------------------------------------------------------"
    Write-Host -Message "Installation Completed"
    Write-Host -Message "--------------------------------------------------------------------------------------"
  }

  #Installing the AWS MSI, I've added a self elevating line that if enabled will reopen the terminal as an admin and proceed with the installation
  function Install_AWSCLI {

    #if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
    Write-Host "Checking if files are in download folder"
    $check_AWSFile = Test-Path -Path "$Global:DownloadFolder\AWS*.msi"
    $check_AWSFile
    if($check_AWSFile -eq $false){

        Write-Host "Looks like the files are missing. Are you sure you downloaded the AWS-CLI installation files?"
    }

    $filefullpath = Get-ChildItem "$Global:DownloadFolder\AWS*.msi" -Recurse | % { $_.FullName }

    Msiexec.exe /i $filefullpath /qn /log "$Global:DownloadFolder\MSIInstall.log"
    Write-Host "Installation in progress, please wait..."
    Start-Sleep -Seconds 40

    Write-Host "AWS configuration will begin"
    Invoke-Expression "C:\'Program Files'\Amazon\AWSCLIV2\aws.exe configure set AWS_ACCESS_KEY_ID $AWSID" -ErrorAction Stop -ErrorVariable AWSErrConf
    Invoke-Expression "C:\'Program Files'\Amazon\AWSCLIV2\aws.exe configure set AWS_ACCESS_KEY_ID $AWSPASS" -ErrorAction Stop
    Invoke-Expression "C:\'Program Files'\Amazon\AWSCLIV2\aws.exe configure set AWS_ACCESS_KEY_ID $AWSREGION" -ErrorAction Stop
    Invoke-Expression "C:\'Program Files'\Amazon\AWSCLIV2\aws.exe configure set AWS_ACCESS_KEY_ID $AWSOUTPUT" -ErrorAction Stop

    Write-Log -Level ERROR -Message "There was an error configuring AWS Error: $AWSErrConf" -logfile "$Global:DownloadFolder\AWSConfigError.txt"

    Write-Host "--------------------------------------------------------------------------------------"
    Write-Host "Installation Completed."
    Write-Host "--------------------------------------------------------------------------------------"

  }

#This fucntion covers the installation of Make, checks for the files first and then runs silent install of the exe
  function Install_Make {
    Write-Host "Checking if files are in download folder"
    $check_Make = Test-Path -Path "$Global:DownloadFolder\Make*.exe"
    if($check_Make -eq $false){

        Write-Host "Looks like the files are missing. Are you sure you downloaded the AWS-CLI installation files?"
    }
    $filefullpathMake = Get-ChildItem "$Global:DownloadFolder\Make*.exe" -Recurse | % { $_.FullName }
    Start-Process $filefullpathMake -ArgumentList "/SILENT" -Wait

    $checkinst = Check_Program_Installed("Make")
    if($checkinst -eq $true){
        Write-Host "Application found in registry, installed successfully"
    }Else{
        Write-Host "Was unable to discover application files in registry"
    }

    Write-Host "--------------------------------------------------------------------------------------"
    Write-Host "Installation Completed."
    Write-Host "--------------------------------------------------------------------------------------"

  }

# This functions covers the Anaconda 3 installation
  function Install_Anaconda {

    Write-Host "Checking if Anaconda files are in the download folder"
    $check_Anaconda = Test-Path -Path "$Global:DownloadFolder\Anaco*.exe" -ErrorVariable ErrorAnaconda -ErrorAction SilentlyContinue
    if($check_Anaconda -eq $false){

        Write-Host "Looks like the files are missing. Are you sure you've downloaded the files?"
    }

    $filefullpathAnaconda = Get-ChildItem "$Global:DownloadFolder\Ana*.exe" -Recurse | % { $_.FullName }
    Start-Process $filefullpathAnaconda -ArgumentList "/InstallationType=JustMe /RegisterPython=0 /S /D=%UserProfile%\Anaconda3" -Wait

    $checkinst = Check_Program_Installed("Anaconda")
    if($checkinst -eq $true){
        Write-Host "Application found in registry, installed successfully"
    }Else{
        Write-Host "Was unable to discover application files in registry"
    }
    Write-Host "--------------------------------------------------------------------------------------"
    Write-Host "Installation Completed."
    Write-Host "--------------------------------------------------------------------------------------"
  }


  function Install_Chrome_and_Drivers{
    Write-Host "Checking if files are in download folder"
    $check_ChromeS = Test-Path -Path "$Global:DownloadFolder\ChromeSetup*.exe" -ErrorVariable ChromeSetupErr -ErrorAction SilentlyContinue
    $check_ChromeDriver = Test-Path -Path "$Global:DownloadFolder\ChromeDrivers*.exe" -ErrorVariable ChromeSetupErr -ErrorAction SilentlyContinue

    if($check_ChromeS -eq $false){
        Write-Host "Looks like the chrome browser file is missing. Make sure to download the file first"
    }
    if($check_ChromeDriver -eq $false){
        Write-Host "Looks like the chrome driver file is missing. Make sure to download the file first"
    }

    $filefullpathChrome = Get-ChildItem "$Global:DownloadFolder\ChromeSetup*.exe" -Recurse | % { $_.FullName }
    $filefullpathChromeDrivers = Get-ChildItem "$Global:DownloadFolder\ChromeDrivers*.exe" -Recurse | % { $_.FullName }
    Start-Process $filefullpathChrome -ArgumentList "/SILENT" -Wait
    Start-Process $filefullpathChromeDrivers -ArgumentList "/SILENT" -Wait

    $checkinst = Check_Program_Installed("Chrome")
    if($checkinst -eq $true){
        Write-Host "Application found in registry, installed successfully"
    }Else{
        Write-Host "Was unable to discover application files in registry"
    }

  }

#This is the one function that combines the downloads of the files which can be achieved directly
#The function is much faster, but error canpturing is not available
#It can be easilly switched to ASYNC in the future if needed
function Download-UsingWebC {


    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Url,
        [string]$Path
    )

    function convertFileSize {
        param(
            $bytes
        )

        if ($bytes -lt 1MB) {
            return "$([Math]::Round($bytes / 1KB, 2)) KB"
        }
        elseif ($bytes -lt 1GB) {
            return "$([Math]::Round($bytes / 1MB, 2)) MB"
        }
        elseif ($bytes -lt 1TB) {
            return "$([Math]::Round($bytes / 1GB, 2)) GB"
        }
    }

    Write-Verbose "URL set to ""$($Url)""."

    if (!($Path)) {
        Write-Verbose "Path parameter not set, parsing Url for filename."
        $URLParser = $Url | Select-String -Pattern ".*\:\/\/.*\/(.*\.{1}\w*).*" -List

        $Path = "./$($URLParser.Matches.Groups[1].Value)"
    }

    Write-Verbose "Path set to ""$($Path)""."

    #Load in the WebClient object.
    Write-Verbose "Loading in WebClient object."
    try {
        $Downloader = New-Object -TypeName System.Net.WebClient
    }
    catch [Exception] {
        Write-Error $_ -ErrorAction Stop
    }

    #Creating a temporary file.
    $TmpFile = New-TemporaryFile
    Write-Verbose "TmpFile set to ""$($TmpFile)""."

    try {

        #Start the download by using WebClient.DownloadFileTaskAsync, since this lets us show progress on screen.
        Write-Verbose "Starting download..."
        $FileDownload = $Downloader.DownloadFileTaskAsync($Url, $TmpFile)

        #Register the event from WebClient.DownloadProgressChanged to monitor download progress.
        Write-Verbose "Registering the ""DownloadProgressChanged"" event handle from the WebClient object."
        Register-ObjectEvent -InputObject $Downloader -EventName DownloadProgressChanged -SourceIdentifier WebClient.DownloadProgressChanged | Out-Null

        #Wait two seconds for the registration to fully complete
        Start-Sleep -Seconds 3

        if ($FileDownload.IsFaulted) {
            Write-Verbose "An error occurred. Generating error."
            Write-Error $FileDownload.GetAwaiter().GetResult()
            break
        }

        #While the download is showing as not complete, we keep looping to get event data.
        while (!($FileDownload.IsCompleted)) {

            if ($FileDownload.IsFaulted) {
                Write-Verbose "An error occurred. Generating error."
                Write-Error $FileDownload.GetAwaiter().GetResult()
                break
            }

            $EventData = Get-Event -SourceIdentifier WebClient.DownloadProgressChanged | Select-Object -ExpandProperty "SourceEventArgs" -Last 1

            $ReceivedData = ($EventData | Select-Object -ExpandProperty "BytesReceived")
            $TotalToReceive = ($EventData | Select-Object -ExpandProperty "TotalBytesToReceive")
            $TotalPercent = $EventData | Select-Object -ExpandProperty "ProgressPercentage"

            Write-Progress -Activity "Downloading File" -Status "Percent Complete: $($TotalPercent)%" -CurrentOperation "Downloaded $(convertFileSize -bytes $ReceivedData) / $(convertFileSize -bytes $TotalToReceive)" -PercentComplete $TotalPercent
        }
    }
    catch [Exception] {
        $ErrorDetails = $_

        switch ($ErrorDetails.FullyQualifiedErrorId) {
            "ArgumentNullException" {
                Write-Error -Exception "ArgumentNullException" -ErrorId "ArgumentNullException" -Message "Either the Url or Path is null." -Category InvalidArgument -TargetObject $Downloader -ErrorAction Stop
            }
            "WebException" {
                Write-Error -Exception "WebException" -ErrorId "WebException" -Message "An error occurred while downloading the resource." -Category OperationTimeout -TargetObject $Downloader -ErrorAction Stop
            }
            "InvalidOperationException" {
                Write-Error -Exception "InvalidOperationException" -ErrorId "InvalidOperationException" -Message "The file at ""$($Path)"" is in use by another process." -Category WriteError -TargetObject $Path -ErrorAction Stop
            }
            Default {
                Write-Error $ErrorDetails -ErrorAction Stop
            }
        }
    }
    finally {
        #Cleanup tasks
        Write-Verbose "Cleaning up..."
        Write-Progress -Activity "Downloading File" -Completed
        Unregister-Event -SourceIdentifier WebClient.DownloadProgressChanged

        if (($FileDownload.IsCompleted) -and !($FileDownload.IsFaulted)) {
            #If the download was finished without termination, then we move the file.
            Write-Verbose "Moved the downloaded file to ""$($Path)""."
            Move-Item -Path $TmpFile -Destination $Path -Force
        }
        else {
            #If the download was terminated, we remove the file.
            Write-Verbose "Cancelling the download and removing the tmp file."
            $Downloader.CancelAsync()
            Remove-Item -Path $TmpFile -Force
        }

        $Downloader.Dispose()
    }
    }

#This is the console menu description
function Show-Menu
{
     param (
           [string]$Title = 'My Menu'
     )
     cls
     Write-Host "================ $Title ================"

     Write-Host "1: Change directory for Downloads"
     Write-Host "2: Clear Temp Folder"
     Write-Host "3: Download GIT-SCM."
     Write-Host "4: Install GIT-SCM"
     Write-Host "5: Download R"
     Write-Host "6: Install R"
     Write-Host "7: Download AWS-CLI"
     Write-Host "8: Install AWSCLI"
     Write-Host "9: Download Make"
     Write-Host "10: Install Make"
     Write-Host "11: Download Anacoonda"
     Write-Host "12: Install Anaconda"
     Write-Host "13: Download Chrome and Chrome Drivers"
     Write-Host "14: Install Chrome and Chrome Drivers"
     Write-Host "Q: Press 'Q' to quit."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {

'1'{
    cls
    Write-Host "Please provide temp directoory for the downloads"
    Write-Host "example : C:\Downloads"
    Write-Host "Or hit enter to set-up Automatic Temp directory"
    $Download = Read-Host "Please provide temp directory: "
    if(!$Download){

        $Global:DownloadFolder = $env:TEMP
    }Else{
        TempFolderCheck -Folder $Download
        $Global:DownloadFolder = $Download
        Write-Host "Your Temp directory is: $Global:DownloadFolder"
    }

}
'2'{
    cls
    Write-Host "Temp Directory $Global:DownloadFolder will be cleared of all files?"
    Remove-Item -Path "$Global:DownloadFolder\*" -Force -WhatIf
    $confirmation = Read-Host "Are you Sure You Want To Proceed (y/n): "
if ($confirmation -eq 'y') {
    Remove-Item -Path "$Global:DownloadFolder\*" -Force
}
    Write-Host "Temp directory $Global:DownloadFolder was cleared of all files"
}
'3'{
    cls
    Write-Host "Checking if instalation files are in download folder"
    $check_GITFile = Test-Path -Path "$Global:DownloadFolder\Git*.exe"

     if($check_GITFile -eq $False){

     Write-Host "I was unable to find the file in $Global:DownloadFolder. Prooceeding with the download "
     Write-Host "Download of GIT-SCM will start in 2 sec"
     start-sleep -seconds 2
     Write-Host "GIT-SCM URL is : $GIT_Base_URL. Will start download"
     Start-Sleep -Seconds 2
     Write-Host "Download location is $Global:DownloadFolder"
     $Req = Invoke-WebRequest -UseBasicParsing -Uri $GIT_Base_URL -ErrorVariable DownlaodError -ErrorAction Stop
     $DownloadLink_GIT =  ($req.Links | where-object outerhtml -match "64-bit Git for Windows Setup").href
     $SizeMB = Get-DwnloadFileSize -URL $DownloadLink_GIT
     Write-Host "The file size is : $SizeMB MB"
     $file_GIT = split-path -Leaf $DownloadLink_GIT
     $Outfile_GITSCM = Join-Path $Global:DownloadFolder $file_GIT
     Download-UsingWebC -Url $DownloadLink_GIT -Path $Outfile_GITSCM
     Unblock-File $Outfile_GITSCM
     Write-Host "--------------------------------------------------------------------------------------"
     Write-Host "Finished."
     Write-Host "--------------------------------------------------------------------------------------"
     }Else{
        Write-Host "files are already in $Global:DownloadFolder"
     }
}
'4'{
    cls
    Install_GITSCM
}
'5'{
    cls
    $check_R = Test-Path -Path "$Global:DownloadFolder\R*.exe" -ErrorVariable RFileMissing -ErrorAction SilentlyContinue

    if($check_R -eq $false)
    {
        Write-Host "Checking if R file is already downloaded in $Global:DownloadFolder"
        Write-Host "Looks like the file is missing. The file will be donloaded"
        Start-Sleep -Seconds 2
        Write-Host "The URL iss: $R_Download_URL"
        $SizeMB = Get-DwnloadFileSize -URL $R_Download_URL
        Write-Host "The file size is : $SizeMB MB"
        Start-Sleep -Seconds 2
        Download-UsingWebC -URL $R_Download_URL -Path "$Global:DownloadFolder\R.exe"
        Write-Host "--------------------------------------------------------------------------------------"
        Write-Host "Finished."
        Write-Host "--------------------------------------------------------------------------------------"
    }Else{

        Write-Host "file already in $Global:DownloadFolder"
    }
}
'6'{
    cls
    Install_R_File
}
'7'{
    cls
    Write-Host "Checking if AWS files are already downloaded in $Global:DownloadFolder"

    $check_AWS = Test-Path -Path "$Global:DownloadFolder\AWS*.msi" -ErrorVariable AWSFileMissing -ErrorAction SilentlyContinue

    if($check_AWS -eq $false)
    {
        Write-Host "Looks like the AWS-CLI is missing...Attepmting download..."
        Write-Log -Level INFO -Message "AWS files are missing, download will begin in 2 sec" -logfile $InfoLogFile
        Write-Host "AWS-CLI URL is : $AWS_CommandLine"
        Start-Sleep -Seconds 2
        $Req = Invoke-WebRequest -UseBasicParsing -Uri $AWS_CommandLine -ErrorVariable DownlaodAWSError -ErrorAction Stop
        $DownloadLink_AWS =  ($req.Links | where-object outerhtml -match "64-bit").href
        $SizeMB = Get-DwnloadFileSize -URL $DownloadLink_AWS
        Write-Host "The file size is : $SizeMB MB"
        Start-Sleep -Seconds 2
        $file_AWS = split-path -Leaf $DownloadLink_AWS
        $Outfile_AWS = Join-Path $Global:DownloadFolder $file_AWS
        Download-UsingWebC -Url $DownloadLink_AWS -Path $Outfile_AWS
        Unblock-File $Outfile_AWS
        Write-Host "--------------------------------------------------------------------------------------"
        Write-Host "Finished."
        Write-Host "--------------------------------------------------------------------------------------"
    }Else{
        Write-Host "AWS-CLI files are already in $Global:DownloadFolder"
    }
}
'8'{
    cls
    Install_AWSCLI
}
'9'{
    cls
    Write-Host "Checking if Make files is already downloaded in $Global:DownloadFolder"

    $check_Make = Test-Path -Path "$Global:DownloadFolder\make*.msi" -ErrorVariable MakeFIlesMissing -ErrorAction SilentlyContinue

    if($check_Make -eq $false)
    {
        Write-Host "Looks like Make is not downloaded. Download will start in 2 seconds"
        $SizeMB = Get-DwnloadFileSize -URL $MAKE_URL
        Write-Host "The file size is : $SizeMB MB"
        Start-Sleep -Seconds 2
        Download-UsingWebC -URL $MAKE_URL -Path "$Global:DownloadFolder\Make.exe"
        Write-Host "--------------------------------------------------------------------------------------"
        Write-Host "Finished."
        Write-Host "--------------------------------------------------------------------------------------"
    }Else{
        Write-Host "Make files are already in $Global:DownloadFolder"
    }

}
'10'{
    cls
    Install_Make
}
'11'{
   cls
   Write-Host "Checking if Anaconda files are already downloaded in $Global:DownloadFolder"

   $check_Anaconda = Test-Path -Path "$Global:DownloadFolder\Anaco*.exe" -ErrorVariable ErrorAnaconda -ErrorAction SilentlyContinue

   if($check_Anaconda -eq $false)
   {
    Write-Host "Anaconda files are missing attempting download"
    $SizeMB = Get-DwnloadFileSize -URL $Anaconda_URL
    Write-Host "The file size is : $SizeMB MB"
    Start-Sleep -Seconds 2
    Download-UsingWebC -URL $Anaconda_URL -Path "$Global:DownloadFolder\Anaconda3.exe"
    Write-Host "--------------------------------------------------------------------------------------"
    Write-Host "Finished."
    Write-Host "--------------------------------------------------------------------------------------"
   }Else{

    Write-Host "Anaconda files are already in $Global:DownloadFolder"
   }

}
'12'{
    cls
    Install_Anaconda
}
'13'{
    cls
    Write-Host "Checking if Chrome and Chrome Drivers are already downloaded in $Global:DownloadFolder"

    $check_ChromeS = Test-Path -Path "$Global:DownloadFolder\ChromeSetup*.exe" -ErrorVariable ChromeSetupErr -ErrorAction SilentlyContinue

    if($check_ChromeS -eq $false)
    {
    Write-Host "Looks like the ChromeSetup file is missing...Attepmting download..."

    $SizeMB = Get-DwnloadFileSize -URL $Chrome_URL
    Write-Host "The file size is : $SizeMB MB"
    Start-Sleep -Seconds 2
    Download-UsingWebC -URL $Chrome_URL -Path "$Global:DownloadFolder\ChromeSetup.exe"
    Write-Host "--------------------------------------------------------------------------------------"
    Write-Host "Finished."
    Write-Host "--------------------------------------------------------------------------------------"

    }Else{
        Write-Host "Files are already in $Global:DownloadFolder"
    }
    $check_ChromeDriver = Test-Path -Path "$Global:DownloadFolder\ChromeDrivers*.exe" -ErrorVariable ChromeSetupErr -ErrorAction SilentlyContinue

    if($check_ChromeDriver -eq $false)
    {
    Write-Host "Looks like the ChromeDriver file is missing...Attepmting download..."
    $SizeMB = Get-DwnloadFileSize -URL $Chrome_Drivers_URL
    Write-Host "The file size is : $SizeMB MB"
    Start-Sleep -Seconds 2
    Download-UsingWebC -URL $Chrome_Drivers_URL -Path "$Global:DownloadFolder\ChromeDriver.zip"
    Write-Host "--------------------------------------------------------------------------------------"
    Write-Host "Finished."
    Write-Host "--------------------------------------------------------------------------------------"
    }Else{
        Write-Host "Files are already in $Global:DownloadFolder"
    }

}
'14'{
    cls
    Install_Chrome_and_Drivers
}
'q'{
    return
   }
 }
     pause
}
until ($input -eq 'q')
