$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -File | Where-Object { $_.Name -ne "global-navbar.html" -and $_.Name -ne "footer.html" -and $_.Name -ne "navbar.html" }

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if responsive.css is already included
    if ($content -notmatch 'responsive\.css') {
        # Find the position to insert the link (after the last CSS link or before the closing head tag)
        if ($content -match '(.*<link[^>]*\.css[^>]*>)(?!.*<link[^>]*\.css[^>]*>)(.*)') {
            $newContent = $content -replace '(.*<link[^>]*\.css[^>]*>)(?!.*<link[^>]*\.css[^>]*>)(.*)', "`$1`n    <!-- Responsive CSS -->`n    <link rel='stylesheet' href='responsive.css'>`$2"
            Set-Content -Path $file.FullName -Value $newContent
            Write-Host "Added responsive CSS to $($file.Name)"
        }
        elseif ($content -match '(.*)</head>(.*)') {
            $newContent = $content -replace '(.*)</head>(.*)', "`$1`n    <!-- Responsive CSS -->`n    <link rel='stylesheet' href='responsive.css'>`n</head>`$2"
            Set-Content -Path $file.FullName -Value $newContent
            Write-Host "Added responsive CSS to $($file.Name)"
        }
        else {
            Write-Host "Could not find insertion point in $($file.Name)"
        }
    }
    else {
        Write-Host "Responsive CSS already included in $($file.Name)"
    }
}

Write-Host "Completed adding responsive CSS to all HTML files"