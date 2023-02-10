# 계산기2 ➕➖✖️➗

## 목차
[1. 프로젝트 소개](#1-프로젝트-소개)<br>
[2. 팀원](#2-팀원)<br>
[3. 타임라인](#3-타임라인)<br>
[4. 시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)<br>
[5. 실행 화면](#5-실행-화면)<br>
[6. 트러블 슈팅](#6-트러블-슈팅)<br>
[7. 팀 회고](#7-팀-회고)<br>
[8. 참고 링크](#8-참고-링크)<br>
<br>

## 1. 프로젝트 소개
각자의 계산기1 프로젝트를 바탕으로 병합 및 리팩토링하기

<br>

## 2. 팀원

| Harry | Goat|
|:----:|:----:|
| <img src="https://i.imgur.com/BYdaDjU.png" width="130" height="130"/> | <img src="https://i.imgur.com/yoWVC56.png" width="130" height="130"/>
| [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/HarryHyeon) | [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/Goatt8)

<br>

## 3. 타임라인
- 23.02.06(월) ~ 23.02.10(금)
    - 계산기2 프로젝트 시작
    - Harry, Goat 각각 코드 선별해서 코드 병합
    - 병합된 코드를 바탕으로한 리팩토링 
<br>

## 4. 시각화된 프로젝트 구조
### 폴더 구조
``` swift
Calculator
    ├── Model
    │   ├── Formula
    │   ├── Operator
    │   ├── ExpressionParser
    │   ├── Enumeration
    │   ├── CalculatorItem
    │   └── Operator
    │
    ├── View
    │   ├── RoundedButton
    │   ├── HistoryViewGenerator
    │   ├── LaunchScreen
    │   └── Main
    │
    │
    ├── Controller
    │   ├── InputManager
    │   ├── CalculatorViewController
    │   ├── AppDelegate
    │   └── SceneDelegate
    │
    └── Extension
        ├── StringExtension
        ├── OperatorExtension
        └── DoubleExtension

```

<br>

### 클래스 다이어그램
[<img src="https://i.imgur.com/EL677Yn.png" width="100%" height="100%"/> 클래스다이어그램.png](https://i.imgur.com/EL677Yn.png)



<br>
<br>

## 5. 실행 화면

<details>
<summary>사칙연산</summary>
<img src="https://i.imgur.com/rn15EoH.gif">
<img src="https://i.imgur.com/BCl4JGp.gif">
<br><br>
<img src="https://i.imgur.com/fhOlLio.gif">
<img src="https://i.imgur.com/cN2O03N.gif">
<br><br>
<img src="https://i.imgur.com/7qgtEks.gif">
</details>

<br>

<details>
<summary>CE</summary>
<img src="https://i.imgur.com/Pnhc0hV.gif">
</details>

<br>

<details>
<summary>AC</summary>
<img src="https://i.imgur.com/oYMhcfw.gif">
</details>

<br>

<details>
<summary>⁺⁄₋</summary>
<img src="https://i.imgur.com/BYFKkur.gif">
</details>

<br>

<details>
<summary>=</summary>
"="을 누른 후에 결과값에 계산을 이어서 할 수 있도록 했습니다.
<br>
<img src="https://i.imgur.com/8zSFels.gif">
</details>


<br>

## 6. 트러블 슈팅

### 1.Merge Conflict
* 계산기2 STEP1 코드병합후 PR을 merge하는 과정에서 두번의 merge conflict가 있었습니다
<img src="https://i.imgur.com/D2KdJIa.png">


#### 과정을 보자면
    * 비어있는 브랜치 A생성, Goat, Harry 각자 브랜치 a, b 생성
    * a에 Goat 병합할 코드 작성후 ( A로 PR merge )/ b에 Harry 병합할 코드 작성후 ( A로 PR merge )
    * 위와같은 과정 반복을 통해 새롭게 생성된 A라는 브랜치는 Goat,Harry의 병합용 브랜치가 되었음
이 상황에서 병합된 A브랜치를 Goat의 기존 **계산기1 STEP3 PR 보냈던 [Yagom - Goatt8]** 브랜치로 보내려 하자 충돌이 발생
<img src="https://i.imgur.com/w3S2w5n.png">
    * 사진에 보이듯 Resovle Conflicts를 눌러 Git 클라이언트로 이동 후
    충돌 표식 `<<<<<<<`, `=======`, `>>>>>>>`을 제거하며 원하는 방향으로 최종병합까지 완료했음에도 conflict가 해결되지않았습니다.
<img src="https://i.imgur.com/yrRhBKQ.png">
* 파일 병합 후 확인해보니 **Asset파일이 제거되는 오류**가 계속되었습니다
* -> 두번의 PR실패 후 결론은 **파일의 분류, 파일의 인덱스나 빌드 자체가 기존에 보냈던 Goat STEP3의 파일과 달라서** 일어나는 현상이라고 생각되었습니다
### 해결
* 결국 **Goat의 STEP3파일을 복제해 새로운 브랜치를 생성**하고 **Harry의 병합할 코드또한 복제된 Goat의 STEP3로 머지**시켜 STEP3의 파일과 동일시시킨 후에 각자 작업을 진행하니 무리없이 PR이 merge되었습니다.

    


<br>

### 2.버튼의 조건검사 기능 분리

#### ViewController에서 계산식을 만들어주는 기능
- 기존에는 버튼 입력에 따라 IBAction 메서드로 처리를 할때 필요한 조건 검사를 ViewController에서 했습니다.
- 조건에 부합하다면 버튼의 기능을 정상적으로 동작시키고 계산식에 삽입하는 방식의 코드로 작성하였습니다.
- ViewController에서 모든 조건을 검사하다보니 버튼 하나의 동작에도 많은 코드가 쓰이게 되어 나중에는 코드를 작성한 사람도 어떤 조건들이었는지 쉽게 읽히지 않는 문제가 있었습니다.

#### InputManager 타입 정의
- IBAction에서 버튼을 눌렀을때 조건을 검사하고 계산식에 삽입하는 과정을 새로운 타입으로 분리하여 ViewController에서의 코드를 간결하게 하였습니다.
- InputManager에서는 현재 계산기에 표시되는 레이블의 연산자 text, 피연산자 text와 계산식을 프로퍼티로 가지게 하였습니다.
- 버튼을 눌렀을때 InputManager 인스턴스를 통해 조건을 검사하고 계산식에 삽입할 수 있도록 코드를 수정했습니다.

<br>

#### 수정전
``` swift
// CalculatorViewController.swift

@IBAction private func numberButtonTapped(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }
        guard isCalculated == false else { return }
        
        if currentNumbersLabelText == "0" {
            currentNumbersLabelText = number
        } else {
            currentNumbersLabelText += number
        }
    }
```

#### 수정후
``` swift
// CalculatorViewController.swift

@IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }

        numberOnField.text = inputManager.handleNumbers(input: currentTitle)
    }

```
``` swift
/// InputManager.swift

func handleNumbers(input: String) -> String {
        if currentNumber == "0" || isCalculated {
            currentNumber = input
            isCalculated = false
        } else {
            currentNumber += input
        }
        
        return currentNumber
    }
```

<br>
<br>

## 7. 팀 회고
<details>
    <summary>팀 회고</summary>
    
### 우리팀이 잘한 점
- 서로 궁금한 것이 있으면 이해될때까지 토론하기
- 서로에게 질문사항이 있으면 상대방이 이해될때까지 답변해주기
- 상대방의 코드에서 각자 좋다고 느끼는 코드를 잘 채택하여 병합한 것

### 우리팀이 개선할 점
- 테스트 코드 작성이 익숙하지 않아 어려움이 많았던것 같다. 코드 커버리지를 확인하며 테스트 케이스 작성하는 것을 조금 더 연습해보기 !

</details>
    
<br/>

## 8. 참고 링크
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Swift Language Guide - Protocol](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [야곰 닷넷 - Unit Test, TDD](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/)
- [Apple Docs - UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
- [Apple Docs - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
<br>
