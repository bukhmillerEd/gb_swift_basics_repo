import UIKit
import Foundation

//  1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car: AnyObject {
    var brand: String { get }
    var year: Int { get }
    var conditionEngine: ConditionEngine { set get }
    var conditionWindows: ConditionWindows { get set }
    
    func perform(action: Actions)
}

enum Actions {
    case changeConditionEngine(condition: ConditionEngine)
    case changeConditionWindows(condition: ConditionWindows)
}

enum ConditionEngine {
    case running
    case stopped
}

enum ConditionWindows {
    case open
    case closed
}
// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension Car {
    
    func perfotmActionWithWindows(conditionWindows: ConditionWindows) {
        self.conditionWindows = conditionWindows
    }
    
    func performActionWithEngine(condition: ConditionEngine) {
        self.conditionEngine = condition
    }
    
    func perform(action: Actions) {
        switch action {
        case .changeConditionEngine(let condition):
            performActionWithEngine(condition: condition)
        case .changeConditionWindows(let condition):
            perfotmActionWithWindows(conditionWindows: condition)
        }
    }
}

// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class SportСar: Car {
    let brand: String
    let year: Int
    var conditionEngine: ConditionEngine
    var conditionWindows: ConditionWindows
    let hasSpoiler: Bool
    var hideSpoiler: Bool
    
    init(brand: String, year: Int, conditionEngine: ConditionEngine, conditionWindows: ConditionWindows, hasSpoiler: Bool, hiddenSpoiler: Bool) {
        self.brand = brand
        self.year = year
        self.conditionEngine = conditionEngine
        self.conditionWindows = conditionWindows
        self.hasSpoiler = hasSpoiler
        self.hideSpoiler = hiddenSpoiler
    }
    
    func performActionWithSpoiler(hide: Bool) {
        if hasSpoiler {
            hideSpoiler = hide
        }
    }
}

class TrunkCar: Car {
    let brand: String
    let year: Int
    var conditionEngine: ConditionEngine
    var conditionWindows: ConditionWindows
    var cisternWorkload: Int
    let volumeCistern: Int
    
    init(brand: String, year: Int, conditionEngine: ConditionEngine, conditionWindows: ConditionWindows, cisternWorkload: Int, volumeCistern: Int) {
        self.brand = brand
        self.year = year
        self.conditionEngine = conditionEngine
        self.conditionWindows = conditionWindows
        self.cisternWorkload = cisternWorkload
        self.volumeCistern = volumeCistern
    }
 
    func uploadTocistern(numberOfLiters: Int) {
        if numberOfLiters >= 0 {
            let freeVolume = volumeCistern - cisternWorkload
            cisternWorkload += min(freeVolume, numberOfLiters)
        } else {
            cisternWorkload -= min(cisternWorkload, numberOfLiters)
        }
    }
}

//  4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportСar: CustomStringConvertible {
    var description: String {
        return """
               brand = \(brand)
               year = \(year)
               conditionEngine = \(conditionEngine)
               conditionWindows = \(conditionWindows)
               hasSpoiler = \(hasSpoiler)
               hideSpoiler = \(hideSpoiler)
               ----------------------------------------
               """
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
               brand = \(brand)
               year = \(year)
               conditionEngine = \(conditionEngine)
               conditionWindows = \(conditionWindows)
               cisternWorkload = \(cisternWorkload)
               volumeCistern = \(volumeCistern)
               ----------------------------------------
               """
    }
}

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
// 6. Вывести сами объекты в консоль.
let sportCar = SportСar(brand: "Ferrari", year: 2020, conditionEngine: .stopped, conditionWindows: .closed, hasSpoiler: true, hiddenSpoiler: false)
let trunkCar = TrunkCar(brand: "Ford", year: 2018, conditionEngine: .stopped, conditionWindows: .closed, cisternWorkload: 100, volumeCistern: 2000)

print(sportCar)
sportCar.performActionWithEngine(condition: .running)
sportCar.perform(action: .changeConditionWindows(condition: .open))
sportCar.performActionWithSpoiler(hide: true)
print(sportCar)

print(trunkCar)
trunkCar.perform(action: .changeConditionEngine(condition: .running))
trunkCar.perform(action: .changeConditionWindows(condition: .open))
trunkCar.uploadTocistern(numberOfLiters: 2000)
print(trunkCar)
