# 다운로드할 파일의 URL
$downloadUrl = "https://github.com/riko-0/download/raw/main/game.zip"
# 다운로드 받을 파일의 저장 경로
$downloadPath = "$env:USERPROFILE\Downloads\game.zip"
# 압축을 풀 경로
$extractPath = "$env:USERPROFILE\Downloads\GameExtracted"
# 바탕화면 경로
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop')
# 바로 가기 만들기 경로
$shortcutPath = [System.IO.Path]::Combine($desktopPath, 'GameShortcut.lnk')

# 게임 다운로드
Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath

# 압축 해제
Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

# 바로 가기 만들기
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = [System.IO.Path]::Combine($extractPath, 'GameExecutable.exe')
$shortcut.Save()