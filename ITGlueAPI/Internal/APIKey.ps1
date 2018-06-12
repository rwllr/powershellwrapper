function Add-ITGlueAPIKey {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [AllowEmptyString()]
        [Alias('ApiKey')]
        [string]$Api_Key
    )
    if ($Api_Key) {
        $x_api_key = ConvertTo-SecureString $Api_Key -AsPlainText -Force 

        Set-Variable -Name "ITGlue_API_Key"  -Value $x_api_key -Option ReadOnly -Scope global -Force
    }
    else {
        Write-Host "Please enter your API key:"
        $x_api_key = Read-Host -AsSecureString

        Set-Variable -Name "ITGlue_API_Key"  -Value $x_api_key -Option ReadOnly -Scope global -Force
    }
}


function Remove-ITGlueAPIKey {
    Remove-Variable -Name "ITGlue_API_Key"  -Force  
}

function Get-ITGlueAPIKey {
    $ITGlue_API_Key
}

New-Alias -Name Set-ITGlueAPIKey -Value Add-ITGlueAPIKey