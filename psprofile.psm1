
import-module posh-git

function ggs {& git status $args}
function ggf {& git fetch}
function ggb {& git branch}
function gga {& git add $args}
function ggaa {& git add *}
function ggc {& git commit -m $args}
function ggck {& git checkout $args}
function ggst {& git stash $args}
function ggstp {& git stash pop $args}
function ggp {& git push $args}
function ggpom {& git pull origin master}
function rebase {& git rebase origin/master}

function gc {& gcloud $args}
function nsl {nslookup $args}
function fdns {ipconfig /flushdns}
function kc {& kubectl $args}
function get-weather {(curl http://wttr.in).content}
function suh {'suh'}
function update-profile {import-module $profile}
function kcswitch {
    param (
        [parameter(Mandatory=$true)]
        $context
    )
    kc config use-context $context
    }
function kccontexts {kc config get-contexts}
function kccurrent {kc config current-context}
New-Alias -Name "k" -Value kc
New-Alias -Name "kcs" -Value kcswitch
New-Alias -Name "grep" -Value Select-String
New-Alias -Name "Dicker" -Value Docker
New-Alias -Name "Digger" -Value Docker
New-Alias -Name "Dogger" -Value Docker
New-Alias -Name "cuddle" -Value kubectl
New-Alias -Name "canine" -value k9s
New-Alias -Name "tf" -Value terraform
function Maintain {
    param(
        [String]
        $project                                            
    )
    start-process -FilePath "C:\Users\teran.selin\AppData\Local\Programs\Microsoft VS Code\code.exe" -ArgumentList "~\git\$project.code-workspace"
}

function nani {
    $history = get-History -count 1 | select-object -ExpandProperty CommandLine
    $command = ($history -split("\s"))[0]

    Get-Help $Command
}

function ConvertTo-Base64 {
    [CmdletBinding(ConfirmImpact = 'None', PositionalBinding)]
    param (
        # The base64 string to encode
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNull()]
        [string[]]
        $InputValue,
        # The encoding of the string
        [Parameter(Mandatory=$false)]
        [ValidateSet('UTF8','ASCII','Unicode','UTF32','UTF7','BigEndianUnicode')]
        [string]
        $Encoding = 'UTF8'
    )
    begin {
        $encd = [System.Text.Encoding]::$Encoding
    }
    process {
        foreach($item in $InputValue) {
            $bytes = $encd.GetBytes($item)
            [System.Convert]::ToBase64String($bytes)
        }
    }
}
function ConvertFrom-Base64 {
    [CmdletBinding(ConfirmImpact = 'None', PositionalBinding)]
    param (
        # The base64 string to decode
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNull()]
        [string[]]
        $InputValue,
        # The encoding of the string
        [Parameter(Mandatory=$false)]
        [ValidateSet('UTF8','ASCII','Unicode','UTF32','UTF7','BigEndianUnicode')]
        [string]
        $Encoding = 'UTF8'
    )
    begin {
        $encd = [System.Text.Encoding]::$Encoding
    }
    process {
        foreach($item in $InputValue) {
            $bytes = [System.Convert]::FromBase64String($item)
            $encd.GetString($bytes)
        }
    }
}

function bgdc {
@'
,-\__\
|f-"Y\|
\()7L/
 cgD                             __ _
 |\(        _______________    .'  Y '>,
  \ \     /                 \ / _   _   \
   \\\   | BE GAY DO CRIMES | )(_) (_)(|}
    \\\   \_______________  / {  4A   } /
     \\\                  \|  \uLuJJ/\l
      \\\                     |3    p)/
       \\\___ __________      /nnm_n//
       c7___-__,__-)\,__)(".  \_>-<_/D
                     \_"-._.__G G_c__.-__<"/ ( \
                         <"-._>__-,G_.___)\   \7\
                        ("-.__.| \"<.__.-" )   \ \
                        |"-.__"\  |"-.__.-".\   \ \
                        ("-.__"". \"-.__.-".|    \_\
                        \"-.__""|!|"-.__.-".)     \ \
                         "-.__""\_|"-.__.-"./      \ l
                          ".__""">G>-.__.-">       .--,_
'@
}
