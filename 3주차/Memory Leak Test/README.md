## Memory Leak Test App

- 클로저에서 self 캡쳐시 memory leak이 발생하기 쉬운 상황을 재연했습니다.
- Navigation Stack에서 ViewController를  Pop시켰을때 deinit이 정상적으로 된다면 memory leak이 발생하지 않았다는 것을 알 수 있습니다.



### 정리

self를 캡쳐하는 장소는 주위 문맥이므로

주위 문맥이 이미 self를 weak으로 캡쳐하였다면 memory leak이 발생하지 않음.

하지만 주위 문맥이 이미 self를 strong으로 캡쳐하였다면

내부의 클로저가 weak self 캡쳐를 진행하더라도 memory leak이 발생함.
