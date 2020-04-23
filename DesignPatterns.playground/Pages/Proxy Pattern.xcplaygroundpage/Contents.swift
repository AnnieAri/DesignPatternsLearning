//: [Previous](@previous)
/**
 
 在代理模式（Proxy Pattern）中，一个类代表另一个类的功能。这种类型的设计模式属于结构型模式。

 在代理模式中，我们创建具有现有对象的对象，以便向外界提供功能接口。
 
 */
protocol GiveGift {
    func giveDolls(mm: SchoolGirl)
    func giveFlowers(mm: SchoolGirl)
    func giveChocolate(mm: SchoolGirl)
}

class SchoolGirl {
    let name: String
    init(name: String) {
        self.name = name
    }
    func recieve() {
        print("你是个好人,谢谢!")
    }
}

class Proxy: GiveGift {
    func giveDolls(mm: SchoolGirl) {
        mm.recieve()
    }
    
    func giveFlowers(mm: SchoolGirl) {
        mm.recieve()
    }
    
    func giveChocolate(mm: SchoolGirl) {
        mm.recieve()
    }
}

class Pursuit {
    let mm: SchoolGirl
    let hxd: Proxy
    init(mm: SchoolGirl, proxy: Proxy) {
        self.mm = mm
         hxd = proxy
    }
    func giveGift() {
        hxd.giveDolls(mm: mm)
        hxd.giveFlowers(mm: mm)
        hxd.giveChocolate(mm: mm)
    }
}

let beauty = SchoolGirl(name: "迪丽热巴")
let lw = Proxy()
let ds = Pursuit(mm: beauty, proxy: lw)


ds.giveGift()

//: [Next](@next)
