//: [Previous](@previous)

/**
 外观模式（Facade Pattern）隐藏系统的复杂性，并向客户端提供了一个客户端可以访问系统的接口。这种类型的设计模式属于结构型模式，它向现有的系统添加一个接口，来隐藏系统的复杂性。

 这种模式涉及到一个单一的类，该类提供了客户端请求的简化方法和对现有系统类方法的委托调用。
 */

class Stock {
    func buy() {
        
    }
    func sell() {
        
    }
}
class Fund {
    private var stockA: StockA
    private var stockB: StockB
    private var stockC: StockC
    private var stockD: StockD
    init() {
        stockA = StockA()
        stockB = StockB()
        stockC = StockC()
        stockD = StockD()
    }
    
    func buyFund() {
        stockA.buy()
        stockB.buy()
        stockC.buy()
        stockD.buy()
    }
    
    func sellFund() {
        stockA.sell()
        stockB.sell()
        stockC.sell()
        stockD.sell()
    }
}

class StockA: Stock {}
class StockB: Stock {}
class StockC: Stock {}
class StockD: Stock {}


let fund = Fund()
fund.buyFund()
fund.sellFund()
//: [Next](@next)
