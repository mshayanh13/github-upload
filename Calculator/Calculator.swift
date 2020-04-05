//
//  Calculator.swift
//  Calculater
//
//  Created by Jacob Luetzow on 1/31/20.
//  Copyright © 2020 Jacob Luetzow. All rights reserved.
//
import Foundation

enum OperationType: String, Equatable {
    case divide = "/"
    case multiply = "*"
    case subtract = "-"
    case add = "+"
    case quit = "q"
}

class Calculator {
    let consoleIO = ConsoleIO()
    var selectedOperation: OperationType?
    var firstNumber: Double?
    var secondNumber: Double?
    
    func start() {
        calculator.instructionMessage()
        calculator.operationInput(value: readLine() ?? "")
        calculator.inputValueMessage()
        calculator.numberInput(value: readLine() ?? "")
    }
    
    func welcomeMessage() {
        consoleIO.displayMessage(message: "Welcome to Command Line Calculator! Press `q` to quit at anytime.")
    }
    
    func instructionMessage() {
        consoleIO.displayMessage(message: "What operation would you like to perform (/, *, -, +)?")
    }
    
    func inputValueMessage() {
        if firstNumber == nil {
            consoleIO.displayMessage(message: "Please enter the first number.")
        } else {
            consoleIO.displayMessage(message: "Please enter the second number.")
        }
    }
    
    private func displayAnswer(value: Double) {
        consoleIO.displayMessage(message: "Answer: \(value)")
    }
    
    func operationInput(value: String) {
        let operation = OperationType(rawValue: value)
        switch operation {
        case .divide:
            selectedOperation = .divide
        case .multiply:
            selectedOperation = .multiply
        case .subtract:
            selectedOperation = .subtract
        case .add:
            selectedOperation = .add
        case .quit:
            selectedOperation = .quit
            exit(EXIT_SUCCESS)
        default:
            consoleIO.displayMessage(message: "Invalid Operation\n", responseType: .error)
            calculator.instructionMessage()
            calculator.operationInput(value: readLine() ?? "")
        }
    }
    
    func numberInput(value: String) {
        guard let number = Double(value) else {
            if let q = OperationType(rawValue: value) {
                if q == .quit { exit(EXIT_SUCCESS) }
            }
            consoleIO.displayMessage(message: "Invalid Input\n", responseType: .error)
            inputValueMessage()
            numberInput(value: readLine() ?? "")
            return
        }
        if firstNumber == nil {
            firstNumber = number
            inputValueMessage()
            numberInput(value: readLine() ?? "")
        } else {
            secondNumber = number
            calculateAnswer()
        }
    }
    
    private func calculateAnswer() {
        guard let fNum = firstNumber, let sNum = secondNumber else { return }
        switch selectedOperation {
        case .divide:
            displayAnswer(value: fNum / sNum)
        case .multiply:
            displayAnswer(value: fNum * sNum)
        case .subtract:
            displayAnswer(value: fNum - sNum)
        case .add:
            displayAnswer(value: fNum + sNum)
        default:
            return
        }
        firstNumber = nil
        secondNumber = nil
        selectedOperation = nil
    }
}

