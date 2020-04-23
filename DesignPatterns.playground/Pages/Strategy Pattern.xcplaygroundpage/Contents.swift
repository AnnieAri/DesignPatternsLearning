//: [Previous](@previous)

/**
 策略模式
 在策略模式（Strategy Pattern）中，一个类的行为或其算法可以在运行时更改。这种类型的设计模式属于行为型模式。

 在策略模式中，我们创建表示各种策略的对象和一个行为随着策略对象改变而改变的 context 对象。策略对象改变 context 对象的执行算法。
 */

enum DiscountType {
    case none
    case `return`(targetMoney: Double,returnMoney: Double)
    case rebate(discount: Double)
}

protocol CashSuper {
    func acceptCash(_ money: Double) -> Double
}

struct CashNormal: CashSuper {
    func acceptCash(_ money: Double) -> Double {
        return money
    }
}

struct CashRebate: CashSuper {
    let discount: Double
    func acceptCash(_ money: Double) -> Double {
        return money * discount
    }
}

struct CashReturn: CashSuper {
    let targetMoney: Double
    let returnMoney: Double
    func acceptCash(_ money: Double) -> Double {
        if money >= targetMoney {
            return money - returnMoney
        }else{
            return money
        }
    }
}

class CashContext {
    private let cs: CashSuper
    init(cs: CashSuper) {
        self.cs = cs
    }
    func getResult(_ money: Double) -> Double {
        return cs.acceptCash(money)
    }
}


let context1 = CashContext(cs: CashNormal())
print(context1.getResult(100))
print(context1.getResult(200))
print(context1.getResult(300))

let context2 = CashContext(cs: CashReturn(targetMoney: 200, returnMoney: 100))
print(context2.getResult(100))
print(context2.getResult(200))
print(context2.getResult(300))

let context3 = CashContext(cs: CashRebate(discount: 0.8))
print(context3.getResult(100))
print(context3.getResult(200))
print(context3.getResult(300))


//: [Next](@next)
