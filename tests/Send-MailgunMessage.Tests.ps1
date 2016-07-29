$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\powershell-notifications" -Force



Describe "Send-MailgunMessage" {
    It "Sends HTML Email" {
        $successMessage =  "Queued. Thank you."
        (Send-MailgunMessage -to $mailRecipient1 -fromName UnitTest -sender "Unit Test" -Domain $mailDomain -APIKey $mailgunKey -html "<br>This is an HTML Unit Test</br>").Message | Should Be $successMessage
    }

    It "Sends Text Email" {
        $successMessage =  "Queued. Thank you."
        (Send-MailgunMessage -to $mailRecipient1 -fromName UnitTest -sender "Unit Test" -Domain $mailDomain -APIKey $mailgunKey -text "This is a Text Unit Test").Message | Should Be $successMessage
    }


}

