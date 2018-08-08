###########################Movefoldercontent.ps1#########################
# AUTHOR  : Eric PELLOUX 
# DATE    : 11-09-2016
# WEB     : www.groupe-folder.fr
# VERSION : 1.0
#
# COMMENT :  This script is a property of Groupe folder, verify is authenticity with the get-filehash cmdlet
# 
#####################################################################
# You need the NtfsSecurity module available on : https://gallery.technet.microsoft.com/scriptcenter/1abd77a5-9c0b-4a2b-acef-90dbb2b84e85 
# You have to put it in C:\Windows\System32\WindowsPowerShell\v1.0\Modules 
#############################VERY IMPORTANT:##########################
# Verifiy the presence of the hash.txt and check the hash
#This script has the following functionalities:#######################

#1 Move content to the old folders redirection linked to an old login to the new folders redirection linked to the new login
#2 Add an NTFS access to the new login. Provide full control on each files/folders 
#######################################################################



#Importation et délacaration des modules et fichiers
Import-module Activedirectory
Import-module NTFSSecurity
$csv = Import-csv C:\scripts\new.csv
$path = "\\toto\users\UserData\"
#Boucle
foreach( $dir in $csv )
{
$source = join-path $path $dir.OldLogin
$destination = join-path $path $dir.SAM
foreach( $subItem in (Get-ChildItem -Path $source) )
        {
            Copy-Item -Path $subItem.FullName -Destination $destination -Recurse -force
        }
Add-NTFSAccess -Path $destination -AccessRights FullControl -Account $dir.SAM
}   
