$test1 =  Test-Path "C:\Program Files (x86)\Windows Resource Kits\Tools\subinacl.exe"
if ($test1) { EXIT 0 } else { EXIT 1 }

