properties { 
  $base_dir  = resolve-path .
  $tools_dir = "$base_dir\tools"
  $sln_file = "$base_dir\S3Emulator.sln" 
  $version = "1.0.0.0"
} 

task default -depends Nuget

task Nuget {
	$nugetConfigs = Get-ChildItem $base_dir -Recurse | ?{$_.name -match "packages\.config"} | select
	foreach ($nugetConfig in $nugetConfigs) {
	  Write-Host "restoring packages from $($nugetConfig.FullName)"
	  .\Tools\NuGet\NuGet.exe install $($nugetConfig.FullName) /OutputDirectory packages
	}
}