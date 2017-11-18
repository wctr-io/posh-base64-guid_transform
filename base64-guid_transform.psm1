# Add a ScriptMethod "ConverBase64GuidToGuid" to the DataType [System.String]
Update-TypeData -TypeName System.String `
                -MemberType ScriptMethod `
                -MemberName ConvertBase64GuidToGuid `
                -Value {[System.Guid]::new([System.Convert]::FromBase64String($this))}

# Add a ScriptMethod "ConverGuidToBase64Guid" to the DataType [System.String]
Update-TypeData -TypeName System.String `
                -MemberType ScriptMethod `
                -MemberName ConvertGuidToBase64Guid `
                -Value {[System.Convert]::ToBase64String([GUID]::new($this).ToByteArray())}

<#
.Synopsis
    Convert Base-64 GUID To GUID
.DESCRIPTION    Convert Base-64 GUID ([System.String]) To GUID ([System.Guid])
.EXAMPLE
    Convert-Base64GuidToGuid -Base64Guid XHDilXGzLkGPxeIiZcuM0w==
.INPUTS
    [System.String] DataType Base-64 GUID e.g. XHDilXGzLkGPxeIiZcuM0w==
.OUTPUTS
    [System.Guid] DataType GUID e.g. 95e2705c-b371-412e-8fc5-e22265cb8cd3
#>
function Convert-Base64GuidToGuid
{
    [CmdletBinding()]
    [Alias("ConvertTo-Guid","ConvertFrom-Base64Guid")]
    [OutputType([System.Guid])]
    Param
    (
        # [System.String] DataType Base-64 GUID e.g. XHDilXGzLkGPxeIiZcuM0w==
        [Parameter(Mandatory=$true,
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true,
                    Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Base64Guid
    )
    return $Base64Guid.ConvertBase64GuidToGuid()
}

<#
.Synopsis
    Convert GUID To Base-64 GUID 
.DESCRIPTION    Convert GUID ([System.String]) To Base-64 GUID ([System.String])
.EXAMPLE
    Convert-GuidToBase64Guid -Guid 95e2705c-b371-412e-8fc5-e22265cb8cd3
.INPUTS
    [System.String] DataType GUID e.g. 95e2705c-b371-412e-8fc5-e22265cb8cd3
.INPUTS
    [System.Guid] DataType GUID e.g. 95e2705c-b371-412e-8fc5-e22265cb8cd3
.OUTPUTS
    [System.String] DataType Base-64 GUID e.g. XHDilXGzLkGPxeIiZcuM0w==
#>
function Convert-GuidToBase64Guid
{
    [CmdletBinding()]
    [Alias("ConvertTo-Base64Guid","ConvertFrom-Guid")]
    [OutputType([System.String])]
    Param
    (
        # [System.String] or [System.Guid] DataType GUID e.g. 95e2705c-b371-412e-8fc5-e22265cb8cd3
        [Parameter(Mandatory=$true,
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true,
                    Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Guid
    )
    return $Guid.ConvertGuidToBase64Guid()
}