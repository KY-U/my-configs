@echo off
REM Copying GlazeWM's configuration:
set sourceFile=.\workspace\window-manager\glazewm\config.yaml
set destinationFolder=%USERPROFILE%\.glzr\glazewm

if not exist "%destinationFolder%" mkdir "%destinationFolder%"
copy "%sourceFile%" "%destinationFolder%\"

if exist "%destinationFolder%\config.yaml" (
	echo GlazeWM configuration copied successfully!
) else (
	echo GlazeWM configuration copy failed
)

REM Copying Zebar configuration:
set sourceFile=.\workspace\topbar\zebar\settings.json
set widget_folder=.\workspace\topbar\zebar\vanilla-clear
set destinationFolder=%USERPROFILE%\.glzr\zebar

if not exist "%destinationFolder%" mkdir "%destinationFolder%"
copy "%sourceFile%" "%destinationFolder%\"
xcopy /Y /Q "%widget_folder%" "%destinationFolder%\vanilla-clear"

set error=0
for %%F in (
	"%destinationFolder%\settings.json"
    "%destinationFolder%\vanilla-clear"
    "%destinationFolder%\vanilla-clear\styles.css"
    "%destinationFolder%\vanilla-clear\vanilla-clear.html"
    "%destinationFolder%\vanilla-clear\vanilla-clear.zebar.json"
) do (
	if not exist %%F (
		set wrror=1
		echo Missing: %%F
	)
)

if %error%==1 (
    echo Zebar configuration copy failed
) else (
    echo Zebar configuration copied successfully!
)

REM Copying WezTerm's configuration:
set sourceFile=.\workspace\terminal\wezterm\wezterm.lua
set destinationFolder=%USERPROFILE%\.config\wezterm

if not exist "%destinationFolder%" mkdir "%destinationFolder%"

copy "%sourceFile%" "%destinationFolder%\"

if exist "%destinationFolder%\wezterm.lua" (
	echo WezTerm configuration copied successfully!
) else (
	echo WezTerm configuration copy failed
)