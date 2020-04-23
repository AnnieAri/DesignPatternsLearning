/**
 设计模式之工厂模式（factory pattern）
 工厂顾名思义就是创建产品，根据产品是具体产品还是具体工厂可分为简单工厂模式和工厂方法模式，根据工厂的抽象程度可分为工厂方法模式和抽象工厂模式。该模式用于封装和管理对象的创建，是一种创建型模式。
 */


/**
 
1.简单工厂模式
 该模式对对象创建管理方式最为简单，因为其仅仅简单的对不同类对象的创建进行了一层薄薄的封装。
 
 */

/**
 计算
 */
enum OperatorMark {
    case add,sub,mul,div
}

class Operator {
    var numberA: Int = 0
    var numberB: Int = 0
    
//    init(_ numberA: Int,_ numberB: Int) {
//        self.numberA = numberA
//        self.numberB = numberB
//    }
    
    func getResult() -> Int {
        return 0
    }
}

class OperatorAdd: Operator {
    override func getResult() -> Int { numberA + numberB }
}

class OperatorSub: Operator {
    override func getResult() -> Int { numberA - numberB }
}

class OperatorMul: Operator {
    override func getResult() -> Int { numberA * numberB }
}

class OperatorDiv: Operator {
    override func getResult() -> Int { numberA / numberB }
}

class OperatorFactory {
    class func createOperate(_ operatorMark: OperatorMark) -> Operator {
        switch operatorMark {
        case .add:
            return OperatorAdd()
        case .sub:
            return OperatorSub()
        case .mul:
            return OperatorMul()
        case .div:
            return OperatorDiv()
        }
    }
}

let numA = 10,numB = 5

let opAdd = OperatorFactory.createOperate(.add)
opAdd.numberA = numA
opAdd.numberB = numB
print(opAdd.getResult())

let opSub = OperatorFactory.createOperate(.sub)
opSub.numberA = numA
opSub.numberB = numB
print(opSub.getResult())

let opMul = OperatorFactory.createOperate(.mul)
opMul.numberA = numA
opMul.numberB = numB
print(opMul.getResult())

let opDiv = OperatorFactory.createOperate(.div)
opDiv.numberA = numA
opDiv.numberB = numB
print(opDiv.getResult())


/**
 2. 工厂方法模式(Factory Method)
 和简单工厂模式中工厂负责生产所有产品相比，工厂方法模式将生成具体产品的任务分发给具体的产品工厂
 */

///简单工厂  一个工厂生成所有对象  工厂 -> 加减乘除
///工厂方法  具体工厂生成具体对象  加法工厂->加法  减法工厂->减法



/**
 3. 抽象工厂模式(Abstract Factory)
 提供一个创建一系列相关或相互依赖对象的接口,而无需指定他们具体的类
 */


/**
 
 */
