//: [Previous](@previous)
/**
 装饰器模式
 装饰器模式（Decorator Pattern）允许向一个现有的对象添加新的功能，同时又不改变其结构。这种类型的设计模式属于结构型模式，它是作为现有的类的一个包装。

 这种模式创建了一个装饰类，用来包装原有的类，并在保持类方法签名完整性的前提下，提供了额外的功能。
 */
class Person {
    private let name: String
    init(name: String) {
        self.name = name
    }
    init() {
        name = ""
    }
    func show() {
        print("装扮的\(name)")
    }
}


class Finery: Person {
    var component: Person?
    func decorate(_ component: Person) {
        self.component = component
    }
    override func show() {
        if let c = component {
            c.show()
        }
    }
}

class Tshirts: Finery {
    override func show() {
        print("大T恤")
        super.show()
    }
}

class BigTrouser: Finery {
    override func show() {
        print("垮裤")
        super.show()
    }
}

let p = Person(name: "小明")

let kk = BigTrouser()
let dtx = Tshirts()
kk.decorate(p)
dtx.decorate(kk)
dtx.show()
//: [Next](@next)
