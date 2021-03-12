# RBX_UI_PROJECT

https://github.com/qwreey75/RBX_UI_PROJECT  

roblox UI 를 위한 몇가지 모듈들 모음  
Advanced Tween 나 Qeact 같은 모듈들은 로블록스 lua 환경 이외에 love 2d 나 코로나 SDK 같은 다른 엔진으로도 이식이 어느정도 가능합니다  
아직 문서는 없음, 시간이 없어요; 나중에 좀 시간 나면 그때 mkdocs 페이지 만들어 드립니다  

rojo 로 빌드하세요  
rojo 말고 빌드할 방법 없습니다  
https://rojo.space/  

일단 수록된 모듈 리스트는  
맨 위에서 부터 시작해서  

AdvancedTween : 커스터마이징 가능한 트윈이팩트  
CWait : 커스텀 wait 라이브러리  
CustomScroll : 바운싱 구현된, Elastic 구현된 스크롤  
DumpTable : 테이블을 스트링으로 덤프  
LineFromPoints : 점 2개를 선으로 이으는 라이브러리  
MaterialUI : 메테레얼 디자인 로블로 옮긴거  
Qeact : roact 간소화 버전 (실험중인거)  
RBXMarkdown : 마크다운형 문서를 로블에서 렌더링 (실험중인거)  
RBXPlayerList : **이게 그 플레이어 리스트**  
SectionsTextLabel : 글자 부분부분 색깔 바꾸는거, 리치텍스트 구현 이전에 만들어졌던걸 그냥 올려둠  
UIDragger : ui 를 마우스로 드래그해서 움직일 수 있도록 만듬 (윈도우와 비슷)  
UIResizer : ui 를 마우스로 크기조절할 수 있도록 만듬 (윈도우와 비슷)  

CustomScroll 는 AdvancedTween 에 종속성이 있습니다, CustomScroll 를 사용하려면 AdvancedTween 도 같이 설치해야합니다  
RBXPlayerList 는 AdvancedTween,MaterialUI 에 종속성이 있습니다, RBXPlayerList 를 사용하려면 종속 모듈들을 같이 설치해야합니다  

필요한거 알아서 골라쓰세요  
어차피 거의 다 코드 몇백줄 이내라 몇분안에 읽기 ㄱㄴ하고 주석도 많이 있어서 코드 구조도 쉽게 파악할 수 있어요  
이게 어렵다면 뭐... 그냥 본인 코딩 실력이 받혀주지 못하는것이고  
