#  SDHBaseBallGame(숫자 야구 게임)

내일배움캠프 iOS 마스터 6기 프로그래밍 기초 주차 과제입니다.

## 프로젝트 개요

숫자 야구 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다.
- 각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다.
- 예를 들어, 상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다.
- 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.

**SDHBaseBallGame**은 macOS의 Command Line Tool로써 개발되었습니다.

## 프로젝트 일정

- **시작일**: 25/03/10
- **종료일**: 25/03/14

## 기술 스택

- Swift

---

## 프로젝트 구현기능

1. Lv1 + Lv3
- 게임이 시작되면 컴퓨터가 0에서 9까지의 서로 다른 3자리의 숫자를 랜덤으로 만듭니다.
- 첫번째 숫자로 0은 만들어지지 않습니다.
2. Lv2
- 정답을 맞추기 위해 3자리 수를 입력하고 힌트를 받습니다.
- 올바르지 않은 입력값에 대해서 오류 문구가 보여집니다.
- 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다.
3. Lv4 + Lv5 + Lv6
- 프로그램이 시작될 때 안내문구가 보여집니다.
- 1을 입력하면 게임이 시작됩니다.
- 2를 입력하면 완료한 게임들에 대해 시도 횟수를 보여줍니다.
- 3을 입력하면 프로그램이 종료됩니다.
- 1, 2, 3 이외의 입력값에 대해서는 오류 메세지가 보여집니다.

<p align="center">
<img src="https://github.com/nbcampMasterChapter2Team4/SDHBaseBallGame/blob/main/Images/Lv4_실행_예시_이미지.png" alt="CampingMate Logo" width="600">

<img src="https://github.com/nbcampMasterChapter2Team4/SDHBaseBallGame/blob/main/Images/Lv5_실행_예시_이미지.png" alt="CampingMate Logo" width="600">

<img src="https://github.com/nbcampMasterChapter2Team4/SDHBaseBallGame/blob/main/Images/Lv6_실행_예시_이미지.png" alt="CampingMate Logo" width="600">
</p>
