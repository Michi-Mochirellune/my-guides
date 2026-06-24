@echo off
chcp 65001 > nul

cd /d "%~dp0"
call service.bat load_game_filter
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"
cd /d %BIN%

start "zapret: games" /min "%BIN%winws.exe" --wf-tcp=443,%GameFilterTCP% --wf-udp=443,%GameFilterUDP% ^
--filter-tcp=443,%GameFilterTCP% --dpi-desync=fake --dpi-desync-repeats=2 --dpi-desync-any-protocol=1 --dpi-desync-cutoff=n4 --dpi-desync-fooling=ts --dpi-desync-fake-tls="%BIN%stun.bin" --dpi-desync-fake-tls="%BIN%tls_clienthello_max_ru.bin" --dpi-desync-fake-http="%BIN%tls_clienthello_max_ru.bin" --new ^
--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=2 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n3 --new ^
--filter-udp=%GameFilterUDP% --dpi-desync=fake --dpi-desync-repeats=2 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp="%BIN%quic_initial_dbankcloud_ru.bin" --dpi-desync-cutoff=n3