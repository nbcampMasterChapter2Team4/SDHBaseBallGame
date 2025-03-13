//
//  BaseBallGame.swift
//  SDHBaseBallGame
//
//  Created by 서동환 on 3/10/25.
//

import Foundation

final class BaseBallGame {
    private let D_E_B_U_G = false
    
    // MARK: - Game System Variable
    private let guessDigit = 3
    private var randIntArr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    private var historyCounter = 0
    private var gameHistory: [Int: Int] = [:]  // [historyCounter: (시도 횟수)]
    private var userInput = ""
    
    
    // MARK: - Gaming Variable
    private var isGameOver = false
    private var correctAnswer: [Int] = []
    private var userAnswer: [Int] = []
    private var strikeCounter = 0
    private var ballCounter = 0
    
    
    // MARK: - Game Launch Method
    func launch() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기    2. 게임 기록 보기    3. 종료하기")
            if let menu = Int(getUserInput()) {
                switch menu {
                case 1:
                    gameStart()
                    break
                case 2:
                    showGameRecord()
                    break
                case 3:
                    exitGame()
                    break
                default:
                    printInputError()
                }
            } else {
                printInputError()
            }
        }
    }
}

private extension BaseBallGame {
    
    // MARK: - Game System Methods
    func getUserInput() -> String {
        print(">>> ", terminator: "")
        return readLine() ?? ""
    }
    
    func showGameRecord() {
        print("\n< 게임 기록 보기 >")
        if gameHistory.isEmpty {
            print("플레이한 게임이 없습니다.")
        } else {
            let sortedGameHistory = gameHistory.sorted { $0.key < $1.key }
            for iter in sortedGameHistory {
                print("\(iter.key)번째 게임: 시도 횟수 - \(iter.value)")
            }
        }
        print()
    }
    
    func exitGame() {
        print("\n종료하시겠습니까?")
        while true {
            print("1. 예    2. 아니오")
            guard let inputNum = Int(getUserInput()) else {
                printInputError()
                continue
            }
            switch inputNum {
            case 1:
                print("\n< 숫자 야구 게임을 종료합니다 >")
                exit(0)
                break
            case 2:
                print()
                return
            default:
                printInputError()
                continue
            }
        }
    }
    
    // 메뉴에서 사용자가 잘못된 입력을 했을 때 오류 출력
    func printInputError() {
        print("올바른 숫자를 입력해주세요\n")
    }
    
    
    // MARK: - Gaming Methods
    func gameStart() {
        initGame()
        print("\n< 게임을 시작합니다 >")
        
        while !isGameOver {
            print("숫자를 입력하세요")
            let input = getUserInput()
            if preprocessInput(input) {
                isGameOver = compareAnswer()
                gameHistory[historyCounter, default: 0] += 1
            }
            
            if D_E_B_U_G {
                printDebugLog()
            }
        }
    }
    
    func initGame() {
        // 게임 변수 초기화
        isGameOver = false
        correctAnswer = []
        historyCounter += 1
        gameHistory[historyCounter] = 0
        
        // 정답 생성
        randIntArr.shuffle()
        for i in 0..<guessDigit {
            var randInt = randIntArr[i]
            if i == 0 && randInt == 0 {
                randInt = randIntArr.last!
            }
            correctAnswer.append(randInt)
        }
    }
    
    // 사용자 입력 전처리(String => Int)
    func preprocessInput(_ input: String) -> Bool {
        userAnswer = []
        if input.count == guessDigit {
            for i in 0..<guessDigit {
                let inputIndex = input.index(input.startIndex, offsetBy: i)
                guard let inputNumAtIndex = input[inputIndex].wholeNumberValue else {
                    printAnswerError()
                    return false
                }
                
                if i == 0 && inputNumAtIndex == 0 {
                    printAnswerError()
                    return false
                }
                
                if userAnswer.contains(inputNumAtIndex) {
                    printAnswerError()
                    return false
                }
                
                userAnswer.append(inputNumAtIndex)
            }
        } else {
            printAnswerError()
            return false
        }
        return true
    }
    
    // 전처리한 사용자 입력과 정답 비교
    func compareAnswer() -> Bool {
        if userAnswer == correctAnswer {
            print("정답입니다!\n")
            return true
        } else {
            strikeCounter = 0
            ballCounter = 0
            
            for i in 0..<guessDigit {
                let userAnswerIndex = userAnswer.index(userAnswer.startIndex, offsetBy: i)
                let correctAnswerIndex = correctAnswer.index(correctAnswer.startIndex, offsetBy: i)
                let userAnswerNumAtIndex = userAnswer[userAnswerIndex]
                let correctAnswerNumAtIndex = correctAnswer[correctAnswerIndex]
                
                if userAnswerNumAtIndex == correctAnswerNumAtIndex {
                    // 스트라이크
                    strikeCounter += 1
                } else if userAnswer.contains(correctAnswerNumAtIndex) {
                    // 볼
                    ballCounter += 1
                }
            }
            
            if strikeCounter > 0 && ballCounter > 0 {
                print("\(strikeCounter)스트라이크 \(ballCounter)볼\n")
            } else if strikeCounter > 0 {
                print("\(strikeCounter)스트라이크\n")
            } else if ballCounter > 0 {
                print("\(ballCounter)볼\n")
            } else {
                print("Nothing\n")
            }
        }
        return false
    }
    
    // 게임 중 사용자가 잘못된 입력을 했을 때 오류 출력
    func printAnswerError() {
        print("올바르지 않은 입력값입니다\n")
    }
    
    // 디버그 로그
    func printDebugLog() {
        print("-------- 디버그 로그 --------")
        print(randIntArr)
        print(correctAnswer)
        print(userAnswer)
        print(strikeCounter)
        print(ballCounter)
        print(gameHistory)
        print("--------------------------")
    }
}
