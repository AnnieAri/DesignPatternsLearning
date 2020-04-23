//: [Previous](@previous)
/**

 组合模式（Composite Pattern），又叫部分整体模式，是用于把一组相似的对象当作一个单一的对象。组合模式依据树形结构来组合对象，用来表示部分以及整体层次。这种类型的设计模式属于结构型模式，它创建了对象组的树形结构。

 这种模式创建了一个包含自己对象组的类。该类提供了修改相同对象组的方式。
 
 */
/**
 
 意图：将对象组合成树形结构以表示"部分-整体"的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。

 主要解决：它在我们树型结构的问题中，模糊了简单元素和复杂元素的概念，客户程序可以像处理简单元素一样来处理复杂元素，从而使得客户程序与复杂元素的内部结构解耦。

 何时使用： 1、您想表示对象的部分-整体层次结构（树形结构）。 2、您希望用户忽略组合对象与单个对象的不同，用户将统一地使用组合结构中的所有对象。

 如何解决：树枝和叶子实现统一接口，树枝内部组合该接口。

 关键代码：树枝内部组合该接口，并且含有内部属性 List，里面放 Component。

 应用实例： 1、算术表达式包括操作数、操作符和另一个操作数，其中，另一个操作符也可以是操作数、操作符和另一个操作数。 2、在 JAVA AWT 和 SWING 中，对于 Button 和 Checkbox 是树叶，Container 是树枝。

 优点： 1、高层模块调用简单。 2、节点自由增加。

 缺点：在使用组合模式时，其叶子和树枝的声明都是实现类，而不是接口，违反了依赖倒置原则。

 使用场景：部分、整体场景，如树形菜单，文件、文件夹的管理。

 注意事项：定义时为具体类。
 
 */

class Company: Equatable {
    let name: String
    init(name: String) { self.name = name }
    func add(company: Company) {}///增加
    func remove(company: Company) {}///移除
    func display(depth: Int) {}///显示
    func lineOfDuty() {}///履行职责
    static func == (lhs: Company, rhs: Company) -> Bool {lhs.name == rhs.name}
}

class ConcreteCompany: Company {
    private var children = [Company]()
    override func add(company: Company) {
        children.append(company)
    }
    override func remove(company: Company) {
        for (i,v) in children.enumerated() {
            if v == company {
                children.remove(at: i)
                break
            }
        }
    }
    override func display(depth: Int) {
        print(String(repeating: "-", count: depth) + name)
        children.forEach{$0.display(depth: depth+2)}
    }
    override func lineOfDuty() {
        children.forEach{$0.lineOfDuty()}
    }
}

class HRDepartment: Company {
    override func display(depth: Int) {
        print(String(repeating: "-", count: depth) + name)
    }
    override func lineOfDuty() {
        print("\(name) 员工招聘培训管理")
    }
}

class FinanceDepartment: Company {
    override func display(depth: Int) {
        print(String(repeating: "-", count: depth) + name)
    }
    override func lineOfDuty() {
        print("\(name) 公司财务收支管理")
    }
}



let root = ConcreteCompany(name: "北京总公司")
root.add(company: HRDepartment(name: "总公司人力资源部"))
root.add(company: FinanceDepartment(name: "总公司财务部"))

let comp = ConcreteCompany(name: "上海华东分公司")
comp.add(company: HRDepartment(name: "华东分公司人力资源部"))
comp.add(company: FinanceDepartment(name: "华东分公司财务部"))
root.add(company: comp)

let comp1 = ConcreteCompany(name: "南京办事处")
comp1.add(company: HRDepartment(name: "南京办事处人力资源部"))
comp1.add(company: FinanceDepartment(name: "南京办事处财务部"))
comp.add(company: comp1)

let comp2 = ConcreteCompany(name: "杭州办事处")
comp2.add(company: HRDepartment(name: "杭州办事处人力资源部"))
comp2.add(company: FinanceDepartment(name: "杭州办事处财务部"))
comp.add(company: comp2)

root.display(depth: 1)
root.lineOfDuty()





//: [Next](@next)
