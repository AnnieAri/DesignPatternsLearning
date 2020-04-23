//: [Previous](@previous)

 /**
 在模板模式（Template Pattern）中，一个抽象类公开定义了执行它的方法的方式/模板。它的子类可以按需要重写方法实现，但调用将以抽象类中定义的方式进行。这种类型的设计模式属于行为型模式。
 */

class TestPaper {
    func question1() {
        print("题目 1")
        print("答案: \(anser1())")
    }
    func question2() {
        print("题目 2")
        print("答案: \(anser2())")
    }
    func question3() {
        print("题目 3")
        print("答案: \(anser3())")
    }
    func anser1()->String {return""}
    func anser2()->String {return""}
    func anser3()->String {return""}
}


class TestPaperA: TestPaper {
    override func anser1() -> String {
        return "A对"
    }
    override func anser2() -> String {
        return "A错"
    }
    override func anser3() -> String {
        return "A 对"
    }
}

class TestPaperB: TestPaper{
    override func anser1() -> String {
        return "B错"
    }
    override func anser2() -> String {
        return "B错"
    }
    override func anser3() -> String {
        return "B对"
    }
}

let paper1 = TestPaperA()
paper1.anser1()
paper1.anser2()
paper1.anser3()

let paper2 = TestPaperB()
paper2.anser1()
paper2.anser2()
paper2.anser3()



//: [Next](@next)
