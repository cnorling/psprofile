function ggs {& git status $args}
function ggf {& git fetch}
function ggb {& git branch}
function gga {& git add $args}
function ggaa {& git add *}
function ggc {& git commit -m $args}
function ggca {& git commit --amend --no-edit}
function ggck {& git checkout $args}
function ggst {& git stash $args}
function ggstp {& git stash pop $args}
function ggp {& git push $args}
function ggpf {& git push --force-with-lease $args}
function ggpom {& git pull origin master}
function ggl {& git log --oneline --graph}
function gc {& gcloud $args}
function nsl {nslookup $args}
function fdns {ipconfig /flushdns}
function k {& kubectl $args}
function p {& pulumi $args}
function get-weather {(curl http://wttr.in).content}
function suh {'suh'}
function update-profile {import-module $profile}
function dwr { dotnet watch run }

New-Alias -Name "grep" -Value Select-String
New-Alias -Name "Dicker" -Value Docker
New-Alias -Name "Digger" -Value Docker
New-Alias -Name "Dogger" -Value Docker
New-Alias -Name "cuddle" -Value kubectl
New-Alias -Name "canine" -value k9s
New-Alias -Name "tf" -Value terraform
New-Alias -Name "reload-profile" -Value update-profile

function Maintain {
    param(
        [String]
        $project,

        [String]
        $repository
    )

    $destinationPath = "$home\git\$project"
    $workspacePath = "$destinationPath.code-workspace"

    # if folder doesn't exist, make it
    if (!(test-path $destinationPath)) {
        new-item -ItemType Directory -path $destinationPath
    }

    # if repo isn't checked out, clone it
    if (!(test-path "$destinationPath\.git")) {
        if (!$repository) {
            # see if a git repo is on the clipboard
            $clipboard = get-clipboard
            if ($clipboard -match '^git@github\.com:(.)*\.git$') {
                $repository = $clipboard
            } else {
                throw "Given repository does not exist locally and is not on your clipboard"
            }
        }
        git clone $repository $destinationPath
    }

    # if workspace exists, open it. If not, make one.
    if (test-path $workspacePath) {
        code.cmd $workspacePath --log off
    } else {
        $json = convertto-json -InputObject @{folders = @(@{path = $project})}
        New-item -path $workspacePath -value $json | out-null
        code.cmd $workspacePath --log off
    }
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

bgdc
