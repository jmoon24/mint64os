# file		makefile
# date		2024-09-13
# author	jmoon 
# brief		가상 OS 이미지를 빌드하기 위한 make 파일

# 기본적으로 빌드를 수행할 목록
all: Kernel32.bin

# 부트 로더의 기능을 테스트 하기 위한 가상의 OS 이미지 빌드

# $< 매크로는 Dependency(:의 오른쪽)의 첫 번째 파일을 의미하는 매크로이며
# 해당 파일에서는 Source/EntryPoint.s 로 치환됨
Kernel32.bin: Source/EntryPoint.s
	nasm -o Kernel32.bin $<

# 소스 파일을 제외한 나머지 파일 정리	
clean:
	rm -f Kernel32.bin
