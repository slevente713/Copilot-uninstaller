winget source update
winget uninstall --id Microsoft.549981C32F101_8wekyb3d8bbwe --silent
Write-Host "Uninstalling Copilot... Copilot törlése... Удаление Copilot... Copilotを削除する... Copilot löschen..." -ForegroundColor Cyan
winget uninstall --id Microsoft.Copilot_8wekyb3d8bbwe --silent
$policyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
if (!(Test-Path $policyPath)) { New-Item -Path $policyPath -Force | Out-Null }
New-ItemProperty -Path $policyPath -Name "TurnOffWindowsCopilot" -PropertyType DWord -Value 1 -Force | Out-Null
$searchPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
New-ItemProperty -Path $searchPath -Name "BingSearchEnabled" -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $searchPath -Name "SearchboxTaskbarMode" -PropertyType DWord -Value 1 -Force | Out-Null
$advancedPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
New-ItemProperty -Path $advancedPath -Name "ShowCopilotButton" -PropertyType DWord -Value 0 -Force | Out-Null
$userPolicyPath = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"
if (!(Test-Path $userPolicyPath)) { New-Item -Path $userPolicyPath -Force | Out-Null }
New-ItemProperty -Path $userPolicyPath -Name "TurnOffWindowsCopilot" -PropertyType DWord -Value 1 -Force | Out-Null
Stop-Process -Name explorer -Force; Start-Process explorer.exe
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCopilotButton" -PropertyType DWord -Value 0 -Force | Out-Null
Stop-Process -Name explorer -Force; Start-Process explorer.exe
Write-Host "Copilot is uninstalled. Please restart your computer! A Copilot törlődött. Indítsd újra a géped! Copilot был удален. Перезапусти компьютер! Copilotが削除されました。コンピュータを再起動してください！ Copilot wurde gelöscht. Starte deinen Computer neu!" -ForegroundColor Cyan
