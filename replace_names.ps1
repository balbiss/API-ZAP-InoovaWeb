$files = Get-ChildItem -Path . -File -Recurse | Where-Object { $_.FullName -notmatch '\\.git\\' }
foreach ($file in $files) {
    if ($file.Extension -match "\.(png|jpg|jpeg|gif|ico|svg|map)$") {
        continue
    }
    
    $content = Get-Content -Path $file.FullName -Raw
    if ($null -ne $content) {
        $newContent = $content -replace 'INOOVAZAP', 'INOOVAZAP'
        $newContent = $newContent -replace 'INOOVAZAP', 'InoovaZAP'
        $newContent = $newContent -replace 'INOOVAZAP', 'Inoovazap'
        $newContent = $newContent -replace 'INOOVAZAP', 'inoovazap'
        $newContent = $newContent -replace 'Inoovazap', 'Inoovazap'
        $newContent = $newContent -replace 'Inoovazap', 'inoovazap'
        
        if ($content -cne $newContent) {
            Set-Content -Path $file.FullName -Value $newContent -NoNewline
        }
    }
}
