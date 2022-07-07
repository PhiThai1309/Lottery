//
//  main.swift
//  Lottery
//
//  Created by Phi Thai on 05/07/2022.
//

import Foundation

var games: String
var gamesInt: Int

print("How many games do you want to play?")
games = readLine() ?? "1"
gamesInt = Int(games) ?? 1

func random(max: Int, list: [Int]) -> [Int]{
    var list = list
    for _ in 0...max {
        list.append(Int.random(in: 1...49))
    }
    return list
}

while gamesInt > 0 {
    var pickTicket: String
    var pickedTicket: [Int] = []
    var choosenTicket: [Int] = []
    var winningNumber: [Int] = []
    
    print("Do you want to pick your own ticket? (true/false)")
    pickTicket = readLine() ?? "false"

    //Random ticket number for the player
    if(pickTicket == "false") {
//        for _ in 0...5 {
//            pickedTicket.append(Int.random(in: 1...49))
//        }
        pickedTicket = random(max: 5, list: pickedTicket)
    }

    //Random ticket number for the system
//    for _ in 0...5 {
//        choosenTicket.append(Int.random(in: 1...49))
//    }
    
    choosenTicket = random(max: 5, list: choosenTicket)

    print("You have picked the ticket: \(pickedTicket)")
    print("The winning ticket is: \(choosenTicket)")

    for i in 0...5 {
        for j in 0...5 {
            if(pickedTicket[i] == choosenTicket[j]) {
                print(pickedTicket[i])
                winningNumber.append(choosenTicket[i])
            }
        }
    }
    
    print("Your ticket have match: \(winningNumber.count)")

    if(winningNumber.count == 1 || winningNumber.count == 2) {
        print("You have won $10")
    } else if(winningNumber.count == 3) {
        print("You have won $100")
    } else if(winningNumber.count == 4) {
        print("You have won $1000")
    }
    
    gamesInt -= 1
}


