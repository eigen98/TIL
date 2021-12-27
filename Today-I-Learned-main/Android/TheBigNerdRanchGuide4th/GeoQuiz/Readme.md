# GeoQuiz

GeoQuiz는 간단한 앱으로 MainActivity 액티비티 하나와 서브 클래스 하나를 가짐.

## chapter1~3
액티비티 = 안드로이드 SDK 클래스의 인스턴스(객체)

> 1.  Android SDK란?

> Android SDK란 'Android Software Development Kit'의 약자. 

> '안드로이드 소프트웨어를 개발하기 위한 툴 킷'


> 1) 안드로이드 API

> - 개발자들이 안드로이드 개발을 손쉽게 하도록 접근을 허용하는 안드로이드 API들

> 2) 안드로이드 응용 프로그램 개발에 필요한 각종 도구들

> - 안드로이드 소스 코드를 실행 가능한 어플리케이션으로 만들기 위한 컴파일러나 에뮬레이터 등

> 3) 샘플 코드들

> - 안드로이드 API사용법을 이해시키기 위한 예제 프로그램 코드들

> 4) 관련 문서들

> - SDK를 사용하기 위한 각종 패키지나 클래스에 대한 설명 등




GeoQuiz프로젝트 생성 
-> MainActivity라는 **Activity 서브 클래스**가 자동 생성.        
(**AppCompatActivity**상속, 과거 안드로이드 버전과의 호환성 지원. 14장)


### GeoQuiz 화면 회전
문제 발생 -> 회전되면(세로->가로) 액티비티 초기화
**why?**
**액티비티 생명주기**의 이해 필요




### 액티비티 생명주기
4가지 상태로 상호전환

**존재하지 않음(nonexistent)**
onCreate(...)      onDestroy()
**중단(stopped)**
onStart()    onStop()
**일시중지(paused)**
onResume()    onPause()
**실행 재개(Resumed)**    -> 포그라운드

각 전환이 발생할 때 액티비티 상태변경을 알려주는 Activity함수들

Activity의 서브 클래스는 **생명주기 콜백(lifecycle callback)**들을 사용해 생명주기의 전환시점에 필요한 일을 처리.


구글 공식문서의 생명주기 그림과 비교
![image](https://user-images.githubusercontent.com/68258365/144980309-9909e4d8-232e-49bf-8b1d-bdafa31bae77.png)



### oncreate
- 액티비티 인스턴스가 생성된 후 안드로이드 운영체제가 호출(화면에 나타나기 전).
- 위젯 인플레이트 (뷰객체로 생성 후 화면에 보여줌)
-  인플레이트 된 위젯의 객체 참조를 얻음(findViewbyId)
-  리스너 설정
-  모델 데이터 연결

### 액티비티 회전시 호출되는 함수들
![image](https://user-images.githubusercontent.com/68258365/144980341-a3de1015-ac1b-457b-b349-577398a65d97.png)

방향이 바뀌면서 MainActivity가 소멸되었다가 다시 새로운 인스턴스로 생성.
**why?** 
장치 회전 -> 장치 구성(device configuration, 장치 상태 특성들의 집합)이 변경. 
런타임 구성 변경이 생길 때 안드로이드는 액티비티 인스턴스를 소멸시키고 적합한 리소스를 찾아 새롭게 빌드.

**how?**
**가로방향에 사용될 대체 리소스 생성.**
- New -> Android Resource File 
- 기존에 세로 레이아웃과 동일한 파일명으로 레이아웃 xml 생성
- 리소스 타입 드롭다운 Layout선택 
- 루트 요소 필드 FrameLayout 입력
- 수식자(qualifier)에서 Orientation선택후 넘기기
- Landscape선택
![image](https://user-images.githubusercontent.com/68258365/144980581-956c9284-6004-49d1-b0d4-30e446269861.png)




## chapter4
지난 3장까지는 적절한 시점에 제공되어야 할 리소스를 만드는 것까지 하였음.
4장에서는 장치 회전과 같은 **런타임 구성 변경** 시 해당 데이터를 보존할 방법을 학습함.(UI상태 유실 결함 해결)

### 해결방법

- **ViewModel** 
	- viewModel 클래스는 JetPack의 lifecycle-extensions 라이브러리에 포함되어 제공
<<<<<<< HEAD
	- 책과 다르게 현재 지원이 중단되어있으므로 lifecycle-viewmodel을 사용하였음.
	![image](https://user-images.githubusercontent.com/68258365/145585279-e00ea3be-fcf8-4744-b6f6-1915e7cfe54e.png)

=======
	- 책과 다르게 현재 	지원이 중단되어있으므로 lifecycle-viewmodel을 사용하였음.
>>>>>>> 8f3c321 (chapter6)
	- 모델 데이터를 화면에 보여주는 기능을 수행.
	- androidx.lifecycle 패키지의 일부, 생명주기를 고려하여 작동하는 컴포넌트(11장,25장)
	- ViewModel의 서브클래스를 생성하고(상속하는 것을 의미?) MainActivity와 연결
	- 구성 변경이 생겨도 계속 존재하다가 액티비티가 종료될 때 소멸
	- 장치 회전 시 액티비티 인스턴스는 소멸되지만 ViewModel인스턴스는  메모리에 남음.
	 ![image](https://user-images.githubusercontent.com/68258365/145585320-45d131c9-bc2d-4c2b-81a1-ad88de893c3d.png)

	
	

- **SIS**
	- saved Instance state
	- 안드로이드 운영체제가 일시적으로 액티비티 외부에 저장하는 데이터
	- Activity.onSaveInstanceState(Bundle)을 오버라이드해서 SIS에 데이터 추가.
	- onSaveInstanceState(Bundle)이 호출될 때 데이터가 저장된 Bundle의 객체는 운영체제에 의해 액티비티의 **액티비티 레코드(activity record)**로 저장
	- 액티비티가 보존 상태이면 액티비티 인스턴스는 존재하지 않지만, 액티비티 레코드 객체는 안드로이드 운영체제에 살아있음. (onDestroy가 호출되지 않음)

### ViewModel vs SIS
	- 소량의 정보를 저장할 때는 SIS 사용, 
	- 많은 데이터에 빠르고 쉽게 접근하고자 메모리에 캐싱할 때는 ViewModel을 사용.

### 돌아보기 
	 앱 회전을 비활성화 해서 해결? 이생각을 실제로 하였는데 책에 설명이 나와있었디.
	 -> 앱의 다른 결함을 일으키기 쉬움
	 **런타임 시에 생길 수 있는 구성 변경** : 창크기 조정, 야간모드 변경 등
	 **프로세스 중단으로 인한 문제**

