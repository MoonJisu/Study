## MVVM 디자인 패턴

<hr></hr>

- **Model + View + View Model**

<h4>1.구조</h4>

![MVVM](https://k.kakaocdn.net/dn/CiXz0/btqBQ1iMiVT/staXr7UO95opKgXEU01EY0/img.png)

**Model**

-어플리케이션에서 사용되는 데이터와 그 데이터를 처리하는 부분

**View**

-사용자에게 보여지는 UI 부분

**View Model**

-뷰를 표현하기 위해 만든 뷰를 위한 모델
-뷰를 나타내 주기 위한 모델이자 뷰를 나타내기 위한 데이터 처리를 하는 부분

<h4>2.동작</h4>

1)사용장츼 Action들은 View를 통해 들어옴
2)View에 Action이 들어오면 Command 패턴으로 View Model에 Action을 전달함
3)View Model은 Model에게 데이터를 요청
4)Model은 Voew Model에게 요청받은 데이터를 요청
5)View Model은 응답 받은 데이터를 가공하여 저장
6)View는 View Model과 Data Binding하여 화면을 나타냄

<h4>3.특징</h4>

*MVVM = Command + Data BInding*
-Command 패턴과 Data Binding을 이용하여 View와 View Model 사이의 의존성을 없앰
-View Model : View = 1 : n 관계

<h4>4.장점</h4>

-View와 Model 사이의 의존성 X
-View와 View Model 사이의 의존성 X
-각각의 부분은 **독립적**이기 때문에 **모듈화** 하여 개발 가능

<h4>5.단점</h4>

-View Model의 설계가 쉽지 않음

