//: [Previous](@previous)
/**
 当对象间存在一对多关系时，则使用观察者模式（Observer Pattern）。比如，当一个对象被修改时，则会自动通知它的依赖对象。观察者模式属于行为型模式。

 */

protocol Subject {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notify()
    var subjectState: String {get set}
}
///秘书
class Secretary: Subject {
    private var action: String = ""
    private var observers: [Observer] = []
    
    func attach(observer: Observer) {
        observers.append(observer)
    }
    
    func detach(observer: Observer) {
        for (i,v) in observers.enumerated() {
            if observer == v {
                observers.remove(at: i)
                break
            }
        }
    }
    
    func notify() {
        observers.forEach {$0.update()}
    }
    
    var subjectState: String {
        get {return action}
        set {action = newValue}
    }
    
    
}
///抽象观察者
class Observer: Equatable {
    let name: String
    let sub: Subject
    init(name: String, sub: Secretary) {
        self.name = name
        self.sub = sub
    }
    func update() {
        
    }
    
    static func == (lhs: Observer, rhs: Observer) -> Bool {
        return lhs.name == rhs.name
    }
}

class StockObserver: Observer {
    override func update() {
        print("\(sub.subjectState),\(name)关闭股票")
    }
}

class NBAObserver: Observer {
    override func update() {
        print("\(sub.subjectState),\(name)关闭直播")
    }
}
let secretary = Secretary()

let mate1 = StockObserver(name: "清风", sub: secretary)
let mate2 = NBAObserver(name: "明月", sub: secretary)
secretary.attach(observer: mate1)
secretary.attach(observer: mate2)

secretary.detach(observer: mate2)

secretary.subjectState = "老板回来了"
secretary.notify()


//: [Next](@next)
