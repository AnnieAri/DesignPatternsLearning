//: [Previous](@previous)

/**
 命令模式（Command Pattern）是一种数据驱动的设计模式，它属于行为型模式。请求以命令的形式包裹在对象中，并传给调用对象。调用对象寻找可以处理该命令的合适的对象，并把该命令传给相应的对象，该对象执行命令。
 */
/**
 意图：将一个请求封装成一个对象，从而使您可以用不同的请求对客户进行参数化。

 主要解决：在软件系统中，行为请求者与行为实现者通常是一种紧耦合的关系，但某些场合，比如需要对行为进行记录、撤销或重做、事务等处理时，这种无法抵御变化的紧耦合的设计就不太合适。

 何时使用：在某些场合，比如要对行为进行"记录、撤销/重做、事务"等处理，这种无法抵御变化的紧耦合是不合适的。在这种情况下，如何将"行为请求者"与"行为实现者"解耦？将一组行为抽象为对象，可以实现二者之间的松耦合。

 如何解决：通过调用者调用接受者执行命令，顺序：调用者→接受者→命令。

 关键代码：定义三个角色：1、received 真正的命令执行对象 2、Command 3、invoker 使用命令对象的入口

 应用实例：struts 1 中的 action 核心控制器 ActionServlet 只有一个，相当于 Invoker，而模型层的类会随着不同的应用有不同的模型类，相当于具体的 Command。

 优点： 1、降低了系统耦合度。 2、新的命令可以很容易添加到系统中去。

 缺点：使用命令模式可能会导致某些系统有过多的具体命令类。

 使用场景：认为是命令的地方都可以使用命令模式，比如： 1、GUI 中每一个按钮都是一条命令。 2、模拟 CMD。

 注意事项：系统需要支持命令的撤销(Undo)操作和恢复(Redo)操作，也可以考虑使用命令模式，见命令模式的扩展。
 */

import Foundation

///抽象命令
protocol Command {
    var receiver: Barbecuer {set get}
    func excuteCommand()
}
extension Command {
    static func == (lhs: Command, rhs: Command) -> Bool {
        ///id 或者 订单号判断是否为一个
        return true
    }
}
///烤羊肉命令
class BakeMuttonCommand: Command {
    var receiver: Barbecuer
    
    init(receiver: Barbecuer) {
        self.receiver = receiver
    }
    
    func excuteCommand() {
        receiver.bakeMutton()
    }
}

class BakeChickenWingCommand: Command {
    var receiver: Barbecuer
    
    init(receiver: Barbecuer) {
        self.receiver = receiver
    }
    func excuteCommand() {
        receiver.bakeChickenWing()
    }
}

class Barbecuer {
    func bakeMutton() {
        print("烤羊肉串")
    }
    func bakeChickenWing() {
        print("烤鸡翅")
    }
}

class Waiter {
    private var orders = [Command]()
    
    ///设置订单
    func setOrder(_ command: Command) {
        if command is BakeChickenWingCommand {
            print("服务员: 鸡翅没有了,请点别的烧烤")
        }else {
            orders.append(command)
            print("增加订单:",command,"时间:",Date())
        }
    }
    func cancelOrder(_ command: Command) {
//        for (i,v) in orders.enumerated() {
//            if v == command {
//            orders.remove(at: i)
//              break
//            }
//        }
    }
    func notify() {
        orders.forEach { (c) in
            c.excuteCommand()
        }
    }
}


///开店前
let boy = Barbecuer()
let bakeMuttonCMD1 = BakeMuttonCommand(receiver: boy)
let bakeMuttonCMD2 = BakeMuttonCommand(receiver: boy)
let bakeChickenWingCMD1 = BakeChickenWingCommand(receiver: boy)
let girl = Waiter()

///营业
sleep(1)
girl.setOrder(bakeMuttonCMD1)
sleep(2)
girl.setOrder(bakeMuttonCMD2)
sleep(4)
girl.setOrder(bakeChickenWingCMD1)

///点菜完毕 通知厨房
girl.notify()




//: [Next](@next)
