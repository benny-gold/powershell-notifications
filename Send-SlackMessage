Function Send-SlackMessage
    {
    Param
    (
    #  Message to send to channel. e.g. "The coffee is ready"
    [Parameter(Mandatory=$True,Position=0)]
    [string]
    $Message,
 
    # WebHook URI. E.g. "https://hooks.slack.com/services/T02S3KI5T/B03QQ123G9/6ZVTiML7c45386iaDEOsZ"
    [Parameter(Mandatory=$false)]
    [string]
    $WebHook=$env:SlackWebHookUri,
 
    # Channel to post in.
    [Parameter(Mandatory=$True,Position=1)]
   [string]
    $Channel
    )
 
    $payload = @{
            channel="#$($channel)";
            text="$($Message)"
            } 
    $payload = ConvertTo-Json $payload
    $body = "payload="+$payload
    return (Invoke-WebRequest -Uri $WebHook -Method Post -Body $body -UseBasicParsing).StatusDescription
    }
