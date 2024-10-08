# MINT64OS
[64비트 멀티코어 OS 원리와 구조](https://www.hanbit.co.kr/store/books/look.php?p_code=B3548683222) 책에 대한 실습 프로젝트 

# 환경 및 설정
### 환경
- OS : macOS Sonoma 버전 14.6.1 (Apple M2 칩)

### 설정 
- xcode-select : clang 및 lldb를 위함
  ```
  xcode-select --install
  ```

- [macos-cross-toolchains](https://github.com/messense/homebrew-macos-cross-toolchains)
  ```
  brew tap messense/macos-cross-toolchains
  # 64bit 크로스 컴파일러 및 툴체인
  brew install x86_64-unknown-linux-gnu
  # 32bit 크로스 컴파일러 및 툴체인
  brew install i686-unknown-linux-gnu

  # 컴파일 예시
  x86_64-linux-gnu-gcc -o test64 test.c
  i686-linux-gnu-gcc -o test32 test.c 
  ```

- [nasm](https://www.nasm.us/) : x86 CPU 아키텍쳐를 위한 어셈블러 (버전 2.16.03)
  ```
  brew install nasm
  ```

- [qemu](https://www.qemu.org/) : 가상머신 애뮬레이터 (버전 9.1.0)
  ```
  brew install qemu
  ```

- [vscode](https://code.visualstudio.com/) : 편집기
  ```
  brew install --cask visual-studio-code
  ```

# 실행
1. 빌드
    ```
    make
    ```
1. 가상머신 실행
    ```
    chmod 755 qemu.sh
    ./qemu.sh
    ```

# 참고 자료
- [저자 웹페이지](http://mint64os.pe.kr/)
- 챕터별 예제 소스: [한빛 미디어 웹사이트](https://download.hanbit.co.kr/exam/1836/)
- 원본 소스코드 (GIT): [저자 공식 Github Repo](https://github.com/kkamagui/mint64os)

# 변경 및 수정 내역
- p. 120 : qemu-x86_64.bat 파일의 내용 (2024-09-07)
  - macOS에 맞게 쉘 스크립트로 수정
  - 불필요 옵션 제거 및 deprecated 옵션 수정
  - 상세 내용은 qemu.sh 파일 참조
- p. 154 : BootLoader.asm 파일의 내용 (2024-09-10)
  - READDATA 라벨 내부의 마지막 섹터까지 읽었는지 판단하는 부분에서 원본 소스 코드는
    ``` 
    cmp al, 19
    ```
    이지만 qemu 에뮬레이터의 플로피디스크가 1.44 MB FD에서 2.88 MB FD로 변경되면서 트랙 당 섹터 개수가 18개에서 36개로 변경되었음. 따라서, 다음과 같이
    ``` 
    cmp al, 37
    ```
    변경해야함 (참고:[저자 웹페이지 게시판](http://jsandroidapp.cafe24.com/xe/development/12035))
- p. 219 - 220 : 새롭게 작성된 모호 모드 커널의 makefile (2024-09-23)
  - 32bit 크로스컴파일러와 함께 설치된 링커를 이용
  - 불필요 옵션 (-melf_i386) 제거
  - 상세 내용은 01.Kernel32/makefile 참조
- p. 223 - 227 : ImageMacker.c 파일 내용 (2024-09-23)
  - 헤더파일 수정
  - O_BINARY 무시하도록 수정
  - 형식지정자 경고 수정
  - 상세 내용은 04.Utility/00.ImageMaker/ImageMaker.c 참조
  - 참고 : [저자 웹페이지 질의 응답](http://jsandroidapp.cafe24.com/xe/qna/941#comment_5936)
    
