 Function Send-MailgunMessage
  {
    <#
    .EXAMPLE Send-MailgunMessage -to octocat@github.com -fromName ben -Sender "The Wolf" -Domain github.com -Subject "An email for you" -APIKey $mailgunKey -html "Message"

    #>

  Param
    (
    # Recipients
    [Parameter(Mandatory=$True,Position=0)]
    [array]
    $to,
    
    [Parameter(Mandatory=$True,Position=1)]
    [string]
    $fromName,

    [string]
    $sender = $fromName,
    
    [Parameter(Mandatory=$True,Position=2)]
    [string]
    $Domain,

    [string]
    $Subject = "Mailgun API Test",
    
    # mailgun API key 
    [Parameter(Mandatory=$True,Position=0)]
    [string]
    $APIKey,

    # Body of the email.

    [parameter(ParameterSetName = "HTML")]
    $html,

    [parameter(ParameterSetName = "Text")]
    [string]
    $text
    )
 
  switch($PSCmdlet.ParameterSetName)  
    {
    "HTML" {
        #$emailBody = @{html="$($HTML)"}
        $emailBody = $html
        }
    "Text" {
        $emailBody = $text
        }
    }

  $from = "$sender <$fromName@$Domain>"
  $to = $to -join "&to="
  $API = "https://api.mailgun.net/v3/$Domain/messages"
  $securePwd = ConvertTo-SecureString $APIKEy -AsPlainText -Force
  $credential = New-Object System.Management.Automation.PSCredential ("api", $securePwd)
  $APICall = "$($API)?from=$($from)&to=$($to)&html=$($emailBody)&subject=$($Subject)"
  Invoke-RestMethod -Uri $APICall -Credential $credential -Method Post
  }

