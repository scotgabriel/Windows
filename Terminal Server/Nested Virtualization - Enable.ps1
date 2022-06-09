# Prerequisites
#   - Windows 10 Pro, Enterprise or Education build 18305 or later (Windows Sandbox is currently not supported on Home SKUs)
#   - AMD64 architecture
#   - Virtualization capabilities enabled in BIOS
#   - At least 4 GB of RAM (8 GB recommended)
#   - At least 1 GB of free disk space (SSD recommended)
#   - At least two CPU cores (four cores with hyperthreading recommended)

Set-VMProcessor -VMName \<VMName> -ExposeVirtualizationExtensions $true