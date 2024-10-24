//
//  main.swift
//  ProblemSolving_2630
//
//  Created by YOUJIM on 5/8/24.
//


import Foundation

var board = [[Int]]()
var count = [0, 0]

for _ in 0 ..< Int(readLine()!)! {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func check(_ x: Int, _ y: Int, _ width: Int) -> Bool {
    for i in x ..< x + width {
        for j in y ..< y + width {
            if board[x][y] != board[i][j] { return false }
        }
    }
    return true
}

func confetti(_ x: Int, _ y: Int, _ width: Int) {
    if check(x, y, width) {
        count[board[x][y]] += 1
        return
    }
    
    let w = width / 2
    
    for i in 0 ..< 2 {
        for j in 0 ..< 2 { confetti(x + i * w, y + j * w, w) }
    }
}

confetti(0, 0, board.count)

for c in count { print(c) }
