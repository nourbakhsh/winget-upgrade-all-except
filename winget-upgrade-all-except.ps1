
$list_of_packages_to_ignore = @("Nvidia.PhysXLegacy","Microsoft.Edge","Mozilla.Firefox","Mozilla.Thunderbird","Microsoft.OneDrive","Valve.Steam","Microsoft.VCRedist.2010.x64","Microsoft.VCRedist.2012.x86","Microsoft.VCRedist.2008.x64","Microsoft.VCRedist.2005.x86","Microsoft.VCRedist.2015+.x64","Microsoft.VCRedist.2008.x86","Google.Chrome","Microsoft.VCRedist.2015+.x64")
$package_list_file = "packagelist.json"

winget.exe export --output $package_list_file --source winget

$list_of_installed_packages_scheme = Get-Content -Path $package_list_file | ConvertFrom-Json

$list_of_installed_packages = $list_of_installed_packages_scheme.Sources.Packages.PackageIdentifier

$list_of_packages_to_upgrade = @()
foreach ($item in $list_of_installed_packages){
    if ($list_of_packages_to_ignore -notcontains $item){
        #$list_of_packages_to_upgrade +=$item
        winget.exe upgrade --id $item
    }
}


#write-host ("winget.exe upgrade -id "+($list_of_packages_to_upgrade -join " "))