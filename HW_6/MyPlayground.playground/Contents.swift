import UIKit

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
struct Queue<Element> {
  
    private(set) var items: [Element] = []
    
    mutating func puch(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeFirst()
    }
   
    // 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    mutating func sort(complition: (Element, Element) -> Bool) {
        items.sort(by: complition)
    }
    
    mutating func filter(complition: (Element) -> Bool) {
        items = items.filter(complition)
    }
    
    // 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    subscript(index: Int) -> Element? {
        get {
            index < items.count ? items[index] : nil
        }
    }
}

var q = Queue<Int>()
q.puch(1)
q.puch(2)
q.puch(3)
q.puch(4)
q.puch(5)
q.puch(6)
q.sort(complition: >)
q.filter {$0 % 2 == 0}
q.pop()
print(q.items)
print(q[1])
print(q[4])
