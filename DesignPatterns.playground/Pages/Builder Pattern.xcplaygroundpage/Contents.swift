//: [Previous](@previous)

/**
 建造者模式（Builder Pattern）使用多个简单的对象一步一步构建成一个复杂的对象。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。

 一个 Builder 类会一步一步构造最终的对象。该 Builder 类是独立于其他对象的。
 */

///抽象  swift 没有抽象类  可以通过 fatalError 来强制子类重写该方法
class PersonBuilder {
    
    func buildHead() {fatalError("子类重写")}
    func buildBody() {fatalError("子类重写")}
    func buildArmLeft() {fatalError("子类重写")}
    func buildArmRight() {fatalError("子类重写")}
    func buildLegLeft() {fatalError("子类重写")}
    func buildLegRight() {fatalError("子类重写")}
}

class PersonThinBuilder: PersonBuilder {
    
}

class PersonFatBuilder: PersonBuilder {
    
}

///指挥者  用来隔离用户与建造过程的关联
class PersonDirector {
    private let pb: PersonBuilder
    init(builder: PersonBuilder) {
        pb = builder
    }
    
    func createPerson() {
        pb.buildHead()
        pb.buildArmLeft()
        pb.buildArmRight()
        pb.buildLegLeft()
        pb.buildLegRight()
    }
}

let ptb = PersonThinBuilder()
let pdThin = PersonDirector(builder: ptb)
pdThin.createPerson()

let pfb = PersonFatBuilder()
let pdFat = PersonDirector(builder: pfb)
pdFat.createPerson()
//: [Next](@next)
