import UIKit

var a = ["one", "two", "three", "four", "five", "six"]
var b = [1,2,3,4,5,6]
var c = ["⬛", "◀", "⚫", "🔶", "⬟"]

class Cookies: Equatable {
    static func ==(lhs: Cookies, rhs: Cookies) -> Bool {
        return false
    }
    
    var type: String?
    init(type: String = "") {
        self.type = type
    }
}

extension Array where Element: Equatable {
    
    mutating func deleteElement(elementToDelete: Element) -> [Element] {
        guard let indexOfElement = self.index(of: elementToDelete) else { return self }
        self.remove(at: indexOfElement)
        return self
    }
    
    mutating func deleteElementByIndex(indexOfElement: Int) -> [Element] {
        
        if indexOfElement >= 0 && indexOfElement <= self.count {
            self.remove(at: indexOfElement)
        }
        return self
    }
}

a.deleteElement(elementToDelete: "six")
b.deleteElement(elementToDelete: 3)
c.deleteElement(elementToDelete: "⚫")

a
b
c

b.deleteElementByIndex(indexOfElement: 2)
c.deleteElementByIndex(indexOfElement: 67)

b
c

var cheesecake = Cookies(type: "Cheesecake")
var brownie = Cookies(type: "Brownie")
var gelly = Cookies(type: "Gelly")

var g = [cheesecake, brownie, gelly]

g.deleteElement(elementToDelete: brownie)
