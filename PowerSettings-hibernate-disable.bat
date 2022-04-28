powercfg -h off

@REM changes HKLM\SYSTEM\CurrentControlSet\Control\Power (32-bit dword "HibernateEnabled" to '0')
@REM 0 = DISABLED, 1 = ENABLED