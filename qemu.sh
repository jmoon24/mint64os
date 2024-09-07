# file		qemu.sh
# date		2024-09-07
# author	jmoon 
# brief		qemu 가상머신을 실행하기 위한 Z 셀 스크립트
#!/bin/zsh

# 수정 사항 (2024-09-07)
# -L . 옵션 제거 (불필요)
# -localtime 옵션 수정 (deprecated) -> -rtc base=localtime
qemu-system-x86_64 -m 64 -fda ./Disk.img -rtc base=localtime -M pc

