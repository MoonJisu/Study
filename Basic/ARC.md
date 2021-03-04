## ARC

- **A**utomatic **R**eference **C**ounting
- 자동으로 메모리를 관리
- 객체에 대한  참조 카운트를 관리하고 0이 되면 자동으로 메모리 해제
- Run time에 계속 실행 X -> compile time에 실행
- Retain cycle에 유의해야함

<hr></hr>

### MRC

- MRC는 Objective - C에서 사용됨
- 수동으로 메모리 관리
- retain, release, autorelease 등을 사용
  - retain : retain count( reference count ) 증가를 통해 현제 scope에서 객체가 유지되는 것을 보장
  - release :  retain count( reference count )를 감소시킴. retain 후에 필요 없을 때 release
- WWDC 2011에 ARC가 등장한 이후 Objective - C는 ARC 여부를 선택할 수 있게됨



<hr></hr>

### ARC 메모리 관리

- Compile time에 자동으로 retain, release를 적절한 위치에 삽입하는 방식

  ![image-20210304165059706](/Users/munjisu/Library/Application Support/typora-user-images/image-20210304165059706.png)

- ARC는 자동으로 retain, release를 삽입해서 retainCount를 관리하고 0이 될때 deinit을 호출해서 메모리 해제

  - retain count 관리하는 공간 = Heap
    - 메모리 관리는 Data, Heap, Stack, Code 4가지 가상 메모리 영역 중 Heap 영역과 관련
    - Heap 영역은 개발자가 동적으로 할당하는 메모리 공간이기 때문에 관리가 필요함
    - Heap 영역에 참조형 자료들이 얼마나 참조되고 있는지 카운팅 하고
    - 이에따라 메모리를 할당 및 제거하는 것을 자동으로 해주는 것이 ARC



