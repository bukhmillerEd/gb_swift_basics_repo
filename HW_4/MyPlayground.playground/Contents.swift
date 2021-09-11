import UIKit

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести значения свойств экземпляров в консоль.
 */

class Car {
    var brand: String
    var color: String
    var year: Int
    
    init(brand: String, color: String, year: Int) {
        self.brand = brand
        self.color = color
        self.year = year
    }
    
    func perform(action: Actions) {
        
    }
    
    func description() {
        print("""
              brand = \(brand)
              color = \(color)
              year = \(year)
              """)
    }
}

class SportСar: Car {
    var maxSpeed: Int
    var hasSpoiler: Bool
    var hiddenSpoiler = true
    
    init(brand: String, color: String, year: Int, maxSpeed: Int, hasSpoiler: Bool) {
        self.maxSpeed = maxSpeed
        self.hasSpoiler = hasSpoiler
        super.init(brand: brand, color: color, year: year)
    }
    
    override func perform(action: Actions) {
        if hasSpoiler {
            switch action {
            case .actionSpoiler(let hide):
                hiddenSpoiler = hide
            default:
                break
            }
        }
    }
    
    override func description() {
        super.description()
        print("""
              maxSpeed = \(maxSpeed)
              hasSpoiler = \(hasSpoiler)
              """)
        if hasSpoiler {
            print("""
                  hiddenSpoiler = \(hiddenSpoiler)
                  """)
        }
    }
}

class TrunkCar: Car {
    var loadСapacity: Int
    var hasTrailer: Bool
    var emptyTrailer = true
    
    init(brand: String, color: String, year: Int, loadСapacity: Int, hasTrailer: Bool) {
        self.loadСapacity = loadСapacity
        self.hasTrailer = hasTrailer
        super.init(brand: brand, color: color, year: year)
    }
    
    override func perform(action: Actions) {
        if hasTrailer {
            switch action {
            case .actionTrailer(let download):
                emptyTrailer = !download
            default:
                break
            }
        }
    }
    
    override func description() {
        super.description()
        print("""
              loadСapacity = \(loadСapacity)
              hasTrailer = \(hasTrailer)
              """)
        if hasTrailer {
            print("""
                  emptyTrailer = \(emptyTrailer)
                  """)
        }
    }
}

enum Actions {
    case actionSpoiler(hide: Bool)
    case actionTrailer(download: Bool)
}

let sportСar = SportСar(brand: "Ford", color: "black", year: 2015, maxSpeed: 200, hasSpoiler: true)
sportСar.description()
sportСar.perform(action: .actionSpoiler(hide: false))
sportСar.description()
sportСar.perform(action: .actionSpoiler(hide: true))
sportСar.description()

let trunkCar = TrunkCar(brand: "KAMAZ", color: "blue", year: 2010, loadСapacity: 3000, hasTrailer: true)
trunkCar.description()
trunkCar.perform(action: .actionTrailer(download: true))
trunkCar.description()



