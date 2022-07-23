
$env:ASPNETCORE_ENVIRONMENT = "Development"   #Disable caching - JS files are otherwise cached.

# Starts a web server in the shell window, allowing you to immediately see code changes.
function watch()
{
  $aspnet_project_name="MyProject"
  Push-Location "$source_dir\$aspnet_project_name"
  iex "dotnet watch run -q --no-hot-reload"  #Cuz hot reload is borked in blazor.
  Pop-Location
}
