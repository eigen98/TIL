# Softsquared iOS Storyboard Education Template

소프트스퀘어드 iOS (storyboard) 교육용 템플릿입니다.
해당 템플릿에서 바로 프로젝트를 진행하기 보다는, 템플릿을 충분히 이해한 뒤 새로운 프로젝트를 만들어 필요한 코드들을 옮기면서 작업을 진행하는걸 권장합니다.

## 기본 설정
1. iOS 13부터 지원
2. iPhone 방향 - Portrait만 유지
3. iPad 지원, 방향 - 완전 삭제
4. Status bar style - dark Content
5. Appearance - Light

## Configuration
1. Constant - 자주 쓰이는 상수 값 저장
2. Certificate - 인증서 저장
3. Secret - 중요한 값 저장
4. Font - 폰트 파일(otf, rtf) 저장
5. Extension - 기존 클래스의 extension 파일 저장
6. Custom - 커스텀 클래스 저장
7. Base - 기본으로 사용되는 클래스 저장

## Action
1. 화면 전환 - modal, navigation, window 이용
2. 인디케이터 - 기본, gif 커스텀
3. 경고창, 팝업 - alert, action sheet, 하단 custom

## Network
1. 로그인 API
    - method : POST
    - encodable을 이용한 request entity
    - decodable을 이요한 response entity
2. KOBIS API를 이용한 영화정보 가져오기
    - method : GET
    - decodable을 이용한 response entity

## Design Pattern
1. View
    - View(.xib) + ViewController(.swift)
    - View와 ViewController는 @IBOutlet과 @IBAction으로 연결
    - 눈에 보이는 UI적 부분과 사용자 인터렉션에 의한 동작을 다루는 역할
2. DataManager
    - 네트워크 통신을 담당하는 역할
    - Alamofire 이용
3. Entity
    - Encodable, Decodable을 이용한 입/출력 객체
    - View와 DataManager를 연결하는 역할
