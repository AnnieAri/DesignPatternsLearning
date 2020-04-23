//: [Previous](@previous)
/**
 解释器模式（Interpreter Pattern）提供了评估语言的语法或表达式的方式，它属于行为型模式。这种模式实现了一个表达式接口，该接口解释一个特定的上下文。这种模式被用在 SQL 解析、符号处理引擎等。
 */
/**
 意图：给定一个语言，定义它的文法表示，并定义一个解释器，这个解释器使用该标识来解释语言中的句子。
 
 主要解决：对于一些固定文法构建一个解释句子的解释器。
 
 何时使用：如果一种特定类型的问题发生的频率足够高，那么可能就值得将该问题的各个实例表述为一个简单语言中的句子。这样就可以构建一个解释器，该解释器通过解释这些句子来解决该问题。
 
 如何解决：构建语法树，定义终结符与非终结符。
 
 关键代码：构建环境类，包含解释器之外的一些全局信息，一般是 HashMap。
 
 应用实例：编译器、运算表达式计算。
 
 优点： 1、可扩展性比较好，灵活。 2、增加了新的解释表达式的方式。 3、易于实现简单文法。
 
 缺点： 1、可利用场景比较少。 2、对于复杂的文法比较难维护。 3、解释器模式会引起类膨胀。 4、解释器模式采用递归调用方法。
 
 使用场景： 1、可以将一个需要解释执行的语言中的句子表示为一个抽象语法树。 2、一些重复出现的问题可以用一种简单的语言来进行表达。 3、一个简单语法需要解释的场景。
 
 注意事项：可利用场景比较少，JAVA 中如果碰到可以用 expression4J 代替。
 */
//:[解释器模式](https://www.runoob.com/design-pattern/interpreter-pattern.html)

///演奏内容
class PlayContext {
    var playText: String = ""
}

///表达式类
class Expresion {
    func interpret(context: PlayContext) {
        if context.playText.count <= 1 {
            context.playText = ""
            return
        }else{
            var playText = context.playText
            let playKey = String(playText.first!)
            
            playText = String(context.playText.dropFirst(2))
            
            let endIndex = playText.firstIndex(of: " ")!
            let playValue = Double(String(playText[..<endIndex]))!
            excute(playKey: playKey, playValue: playValue)
            
            context.playText = String(playText[playText.index(endIndex, offsetBy: 1)...])
//            print("结束后: "+context.playText)
        }
        
    }
    
    func excute(playKey: String, playValue: Double) {
        fatalError("子类重写")
    }
}

///音符类
class Note: Expresion {
    override func excute(playKey: String, playValue: Double) {
        var note: String
        switch playKey {
        case "C":
            note = "1"
        case "D":
            note = "2"
        case "E":
            note = "3"
        case "F":
            note = "4"
        case "G":
            note = "5"
        case "A":
            note = "6"
        case "B":
            note = "7"
        default:
            note = ""
        }
        print(note,terminator:" ")
    }
}

class Scale: Expresion {
    override func excute(playKey: String, playValue: Double) {
        var scale: String
        switch Int(playValue) {
        case 1:
            scale = "低音"
        case 2:
            scale = "中音"
        case 3:
            scale = "高音"
        default:
            scale = ""
        }
        print(scale,terminator:" ")
    }
}

let context = PlayContext()
context.playText = "O 2 E 0.5 G 0.5 A 3 E 0.5 G 0.5 D 3 E 0.5 G 0.5 A 0.5 O 3 C 1 O 2 A 0.5 G 1 C 0.5 E 0.5 D 3 "

while context.playText.count > 0 {
    if let str = context.playText.first {
        switch str {
        case "O":
            Scale().interpret(context: context)
        case "C","D","E","F","G","A","B":
            Note().interpret(context: context)
        default:break

        }
    }
}

//: [Next](@next)
