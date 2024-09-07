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
  # 64bit 컴파일러
  brew install x86_64-unknown-linux-gnu
  # 32bit 컴파일러  
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
- 120p. qemu-x86_64.bat 파일의 내용 (2024-09-07)
  - macOS에 맞게 쉘 스크립트로 수정
  - 불필요 옵션 제거 및 deprecated 옵션 수정
  - 상세 내용은 qemu.sh 파일 참조

