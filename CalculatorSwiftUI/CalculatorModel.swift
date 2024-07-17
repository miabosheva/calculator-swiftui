import Foundation
import SwiftUI

enum CalculatorOperation {
    case none, addition, subtraction, multiplication, division, percent
}

class CalculatorModel: ObservableObject {
    @Published var display: String = "0"
    private var currentNumber: String = "0"
    private var previousNumber: String = ""
    private var currentOperation: CalculatorOperation = .none
    private var inMiddleOfTyping: Bool = false
    
    func inputNumber(_ number: String) {
        if inMiddleOfTyping {
            if number == "+/-" {
                currentNumber = String(Int(currentNumber) ?? 0 * -1)
            } else {
                currentNumber += number
            }
        } else {
            currentNumber = number
            inMiddleOfTyping = true
        }
        display = currentNumber
    }
    
    func inputOperation(_ operation: CalculatorOperation) {
        if inMiddleOfTyping {
            if currentOperation != .none {
                performOperation()
            } else {
                previousNumber = currentNumber
            }
            inMiddleOfTyping = false
        }
        currentOperation = operation
    }
    
    private func performOperation() {
        guard let prevNumber = Double(previousNumber),
              let currNumber = Double(currentNumber) else { return }
        var result: Double = 0
        
        switch currentOperation {
        case .addition:
            result = prevNumber + currNumber
        case .subtraction:
            result = prevNumber - currNumber
        case .multiplication:
            result = prevNumber * currNumber
        case .division:
            if currNumber != 0 {
                result = prevNumber / currNumber
            } else {
                display = "Error"
                resetCalculator()
                return
            }
        case .none:
            return
        case .percent:
            result = prevNumber.truncatingRemainder(dividingBy: currNumber)
        }
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = String(Int(result))
        } else {
            currentNumber = String(result)
        }
        
        display = currentNumber
        previousNumber = currentNumber
        currentOperation = .none
    }

    func inputEquals() {
        performOperation()
        inMiddleOfTyping = false
    }

    func clear() {
        resetCalculator()
        display = "0"
    }

    private func resetCalculator() {
        currentNumber = "0"
        previousNumber = ""
        currentOperation = .none
        inMiddleOfTyping = false
    }
}
