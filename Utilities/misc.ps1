
#Builds a project in your solution and runs it in debug, passing in your argument. Useful for creating CLI utilities in C#
function run_util($util)
{
  $project_name="MyProject"
   devenv "$source_dir\$project_name\$project_name.csproj" /Project $project_name /ProjectConfig Release /Build | Out-Null
   iex "$source_dir\$project_name\bin\Debug\net6.0\$project_name.exe ${util}"
}
