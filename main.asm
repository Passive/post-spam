format PE CONSOLE 4.0
entry main

include '%fasminc%\win32a.inc'

section '.code' executable readable writeable

main:
        repeat 30
                invoke CreateProcess,0,command,NULL,NULL,FALSE,NORMAL_PRIORITY_CLASS,NULL,NULL,STARTUP_INFO,PROCESS_INFO ; Execute CURL command
        end repeat

        call    [ExitProcess]           ; Exit the program



section '.data' data readable writeable
command         db            "C:\Windows\system32\curl.exe -d ",34,"content=Sent by assembly",34,32,34,"https://discord.com/api/webhooks/854519703326031882/sZfv4cbquXj03zrksitx6EdexL5G1rEgDjrbr6yplgNfQixIy7wA6L6K3HfTy7Bf2XYR",34

section '.udata' readable writeable
STARTUP_INFO STARTUPINFO
PROCESS_INFO PROCESS_INFORMATION

section '.idata' import data readable writeable

        library kernel,'KERNEL32.DLL',\
                msvcrt,'msvcrt.dll'

        import kernel,\
               ExitProcess,'ExitProcess',\
               CreateProcess,'CreateProcessA'

