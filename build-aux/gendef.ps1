param(
    [string] $file
)

dumpbin /SYMBOLS $file | `
    Where-Object { $_ -like "*External*" } | `
    ForEach-Object { $_.Split("| ")[-1] } | `
    Where-Object { $_ -like "*pixman*"}