Function New-PushalotNotification
    {
    [OutputType([Object])]
    Param
        (
        [string]$AuthorizationToken,
        [string][Parameter(Mandatory=$True,Position=1)]
        [string]$Title,
        [string][Parameter(Mandatory=$True)]
        [string]$Body,
        [string]$LinkTitle,
        [string]$Link,
        [boolean]$IsImportant=$false,
        [boolean]$IsSilent=$false,
        [string]$Image,
        [string]$Source,
        [int32]$TimeToLive=43200
        )



    $PushAPI = "https://pushalot.com/api/sendmessage"
    $PushBody = @{
        "AuthorizationToken"=$AuthorizationToken;
        "Title"=$Title;
        "Body"="$body";
        "LinkTitle"=$LinkTitle;
        "Link"=$Link;
        "IsImportant"=$IsImportant;
        "IsSilent"=$IsSilent;
        "Image"=$Image;
        "Source"=$Source
        "TimeToLive"=$TimeToLive
        } 

    $PushJSON =  ConvertTo-Json $PushBody
    $response = Invoke-RestMethod -Method Post -Uri $PushAPI -Body $PushJSON -ErrorAction SilentlyContinue -ContentType "application/json"
    $response 
    }
