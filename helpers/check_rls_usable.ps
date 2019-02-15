$daysOffset = 0
While ($daysOffset -gt -100) {
    Write-Host " === === === "
    $rustDate = (Get-Date).AddDays($daysOffset).ToString("yyyy-MM-dd")
    Write-Host "Checking $rustDate..."

    # Mimic `curl -s`
    $progressPreference = 'silentlyContinue'
    $response = Invoke-WebRequest "https://static.rust-lang.org/dist/$rustDate/channel-rust-nightly.toml"

    if($response.StatusCode -ne 200) {
        Write-Host "Rust $rustDate does not exist"
    }
    else {
        if((Select-String -Pattern "rls-nightly-x86_64-pc-windows-msvc.tar.gz" -InputObject $response.RawContent) -and `
           (Select-String -Pattern "rustfmt-nightly-x86_64-pc-windows-msvc.tar.gz" -InputObject $response.RawContent) ) {
           echo "Rust $rustDate has both rls and rustfmt"
           echo "Run ""rustup default nightly-$rustDate"" to install it"
           break;
        }
    }
    $daysOffset -= 1;
}
