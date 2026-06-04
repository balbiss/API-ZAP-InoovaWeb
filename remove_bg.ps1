Add-Type -AssemblyName System.Drawing
$files = @("static\images\favicon.png", "static\images\background_image.png", "static\favicon.ico")

foreach ($file in $files) {
    if (Test-Path $file) {
        $path = (Resolve-Path $file).Path
        $img = [System.Drawing.Bitmap]::FromFile($path)
        $bmp = new-object System.Drawing.Bitmap($img)
        $img.Dispose()
        
        # Make white transparent
        $white = [System.Drawing.Color]::White
        $bmp.MakeTransparent($white)
        
        $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
        $bmp.Dispose()
    }
}
