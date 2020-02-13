# Ghost on Azure w/ Terraform

Here you will find a just what you need to provision a Ghost blog on Azure using Terraform

# Ready



# Set



|     Key           |Value                          
|----------------|-------------------------------
|Name            | "GhostBlobVolume"     
|Storage accounts |`"<storage account name>"`
|Storage type    |`Azure Blob`|
|Storage container  |`<container name>`|
|Mount path  |`/var/lib/ghost/content_blob`|

|     Key           |Value                          
|----------------|-------------------------------
|Name            | "GhostFilesVolume"     
|Storage accounts |`"<storage account name>"`
|Storage type    |`Azure Files`|
|Storage container  |`<container name>`|
|Mount path  |`/var/lib/ghost/content_files`|

# Go 