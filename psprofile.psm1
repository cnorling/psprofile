
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
function gc {& gcloud $args}
function nsl {nslookup $args}
function fdns {ipconfig /flushdns}
function kc {& kubectl $args}
function get-weather {(curl http://wttr.in).ParsedHtml.body.outerText}
function suh {'suh'}
function update-profile {import-module $profile}
function kcswitch {
    param (
        [parameter(Mandatory=$true)]
        [validateset(
            'codesigner', 
            'devops', 
            'docker-desktop', 
            'library',
            'minikube', 
            'old-library-prod', 
            'old-library-stage', 
            'minikube', 
            'old_devops', 
            'staging',
            'website'
            )]
        [string]$context
    )
    kc config use-context $context}
function kccontexts {kc config get-contexts}
function kccurrent {kc config current-context}
New-Alias -Name "kcs" -Value kcswitch
New-Alias -Name "grep" -Value Select-String
New-Alias -Name "Dicker" -Value Docker
New-Alias -Name "Digger" -Value Docker
New-Alias -Name "Dogger" -Value Docker
function Maintain {
    param(
        [String]
        $project
    )
    & "C:\users\teran.selin\git\$project.code-workspace"
}

function nani {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "", Justification="Shut up, PowerShell.")]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$Command = (((Get-History -Count 1 | Select-Object -ExpandProperty CommandLine) -split("\s"))[0] -replace("[^a-zA-Z0-9\-_]", ""))
    )

    Get-Help $Command
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
