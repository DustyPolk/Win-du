function du {

$FinalResult = @()
Get-ChildItem -Directory -Force | foreach-object {
$totalsize = [long]0
Get-ChildItem -File -Recurse -Force -ErrorAction SilentlyContinue -Path $_.Name | ForEach-Object {$totalsize += $_.Length}

$FinalResult += New-Object psobject -Property @{
                        Dir = $_.Name
                        Size = $totalsize
                        }  
}
$FinalResult |Sort-Object -Property Size | select Dir, @{Name="GB"; Expression={[math]::round($_.Size/1GB, 2)}}

}
