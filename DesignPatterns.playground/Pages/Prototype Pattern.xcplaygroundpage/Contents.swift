//: [Previous](@previous)
/**
 Prototype Pattern
 原型模式（Prototype Pattern）是用于创建重复的对象，同时又能保证性能。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。

 这种模式是实现了一个原型接口，该接口用于创建当前对象的克隆。当直接创建对象的代价比较大时，则采用这种模式。例如，一个对象需要在一个高代价的数据库操作之后被创建。我们可以缓存该对象，在下一个请求时返回它的克隆，在需要的时候更新数据库，以此来减少数据库调用。
 */

protocol IClonealbe {
    func clone() -> Self
}

class Resume: IClonealbe {
    
    let name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func clone() -> Self {
        let new = Resume(name: name, age: age)
        return new as! Self
    }
    func show() {
        print("name: \(name)  age: \(age)")
    }
}


let xiaoming = Resume(name: "小明", age: 12)
let xiaomingCopy = xiaoming.clone()

xiaoming.show()
xiaomingCopy.show()

xiaomingCopy.age = 30
xiaoming.show()
xiaomingCopy.show()
//: [Next](@next)
