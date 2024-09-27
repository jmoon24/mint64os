# file		makefile
# date		2024-09-10
# author 	kkamagui
# editor	jmoon
# brief		OS 이미지를 빌드하기 위한 make 파일

# 기본적으로 빌드를 수행할 목록
all: BootLoader Kernel32 Disk.img Utility

# 부트 로더 빌드를 위해 부트 로더 디렉터리에서 make 실행
BootLoader:
	@echo 
	@echo ============== Build Boot Loader ===============
	@echo 
	
	make -C 00.BootLoader

	@echo 
	@echo =============== Build Complete ===============
	@echo 

# 가상 OS 이미지 빌드를 위해 보호 모드 커널 디렉터리에서 make 실행
Kernel32:
	@echo 
	@echo ============== Build 32bit Kernel ===============
	@echo 
	
	make -C 01.Kernel32

	@echo 
	@echo =============== Build Complete ===============
	@echo 

# OS 이미지 생성

# $^ 매크로는 Dependency(:의 오른쪽)의 전체 파일을 의미하는 매크로

Disk.img: 00.BootLoader/BootLoader.bin 01.Kernel32/Kernel32.bin
	@echo 
	@echo =========== Disk Image Build Start ===========
	@echo 

	./ImageMaker.exe $^

	@echo 
	@echo ============= All Build Complete =============
	@echo

# 유틸리티 빌드
Utility:
	@echo 
	@echo =========== Utility Build Start ===========
	@echo 

	make -C 04.Utility

	@echo 
	@echo =========== Utility Build Complete ===========
	@echo  
	
# 소스 파일을 제외한 나머지 파일 정리	
clean:
	make -C 00.BootLoader clean
	make -C 01.Kernel32 clean
	make -C 04.Utility clean
	rm -f Disk.img	