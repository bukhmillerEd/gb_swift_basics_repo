import UIKit
/*
1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
*/

class Wallet {
    private var sum = 0
    private var freeSpace = 100
    private var bankCard: BankCard?
    
    init(bankCard: BankCard?) {
        self.bankCard = bankCard
    }
    
    func addMoney(sum: Int) throws {
        if self.freeSpace - 20 < 0 {
            throw Errors.notEnoughSpace
        } else {
            self.freeSpace -= 20
            self.sum += sum
        }
    }
    
    func takeMoney(sum: Int) throws {
        if sum > self.sum {
            throw Errors.notEnoughMoney
        } else {
            self.sum -= sum
            self.freeSpace += 20
        }
    }
    
    func calculateMoney() -> Int {
        return sum
    }
    
    func takeBankCard() throws -> BankCard? {
        if let bc = self.bankCard {
            return bc
        } else {
            throw Errors.noBankCard
        }
    }
}

enum Errors: Error {
    case notEnoughMoney
    case notEnoughSpace
    case noBankCard
}

class BankCard: CustomStringConvertible {
    var description: String  = "\"Bank card 1234 5678\""
}

let wallet = Wallet(bankCard: BankCard())

do {
    try wallet.addMoney(sum: 100)
    print(wallet.calculateMoney())
    try wallet.addMoney(sum: 100)
    print(wallet.calculateMoney())
    try wallet.addMoney(sum: 100)
    print(wallet.calculateMoney())
    try wallet.addMoney(sum: 100)
    print(wallet.calculateMoney())
    try wallet.addMoney(sum: 100)
    print(wallet.calculateMoney())
    try wallet.addMoney(sum: 100)
    print("Операция добавления денег успешно выполнена.")
} catch Errors.notEnoughSpace {
    print("Нет места в кошельке")
}


do {
    print(wallet.calculateMoney())
    try wallet.takeMoney(sum: 200)
    print("Операция изьятия денег успешно выполнена.")
} catch Errors.notEnoughMoney {
    print("Недостаточно денег")
}

do {
    if let bc = try wallet.takeBankCard() {
        print("Какие-то действия с банковской картой \(bc)...")
    }
} catch Errors.noBankCard {
    print("Нет банковской карты в кошельке")
}

