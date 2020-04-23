//: [Previous](@previous)
/**
 享元模式（Flyweight Pattern）主要用于减少创建对象的数量，以减少内存占用和提高性能。这种类型的设计模式属于结构型模式，它提供了减少对象数量从而改善应用所需的对象结构的方式。

 享元模式尝试重用现有的同类对象，如果未找到匹配的对象，则创建新对象。
 */
/**
 意图：运用共享技术有效地支持大量细粒度的对象。

 主要解决：在有大量对象时，有可能会造成内存溢出，我们把其中共同的部分抽象出来，如果有相同的业务请求，直接返回在内存中已有的对象，避免重新创建。

 何时使用： 1、系统中有大量对象。 2、这些对象消耗大量内存。 3、这些对象的状态大部分可以外部化。 4、这些对象可以按照内蕴状态分为很多组，当把外蕴对象从对象中剔除出来时，每一组对象都可以用一个对象来代替。 5、系统不依赖于这些对象身份，这些对象是不可分辨的。

 如何解决：用唯一标识码判断，如果在内存中有，则返回这个唯一标识码所标识的对象。

 关键代码：用 HashMap 存储这些对象。

 应用实例： 1、JAVA 中的 String，如果有则返回，如果没有则创建一个字符串保存在字符串缓存池里面。 2、数据库的数据池。

 优点：大大减少对象的创建，降低系统的内存，使效率提高。

 缺点：提高了系统的复杂度，需要分离出外部状态和内部状态，而且外部状态具有固有化的性质，不应该随着内部状态的变化而变化，否则会造成系统的混乱。

 使用场景： 1、系统有大量相似对象。 2、需要缓冲池的场景。

 注意事项： 1、注意划分外部状态和内部状态，否则可能会引起线程安全问题。 2、这些类必须有一个工厂对象加以控制。
 */
//: [享元模式](https://www.runoob.com/design-pattern/flyweight-pattern.html)

struct User {
    let name: String
}

///抽象网站类
class WebSite {
    func use(user: User){}
}

///具体网站类
class ConcreteWebSiet: WebSite {
    let name: String
    init(name: String) {
        self.name = name
        super.init()
    }
    override func use(user: User) {
        print("网站分类: "+name+"用户: "+user.name)
    }
}

///网站工厂
class WebSiteFactory {
    var flyweights: [String : WebSite] = [:]
    func getWebSiteCategory(with key: String) -> WebSite {
        if let webSite = flyweights[key] {
            return webSite
        }else{
            let webSite = ConcreteWebSiet(name: key)
            flyweights[key] = webSite
            return webSite
        }
    }
    var webSiteCount: Int {
        return flyweights.count
    }
}

let factory = WebSiteFactory()

let fx = factory.getWebSiteCategory(with: "产品展示")
fx.use(user: User(name: "鸣人"))

let fy = factory.getWebSiteCategory(with: "产品展示")
fy.use(user: User(name: "佐助"))

let fz = factory.getWebSiteCategory(with: "产品展示")
fz.use(user: User(name: "小樱"))

let fl = factory.getWebSiteCategory(with: "博客")
fl.use(user: User(name: "一方通行"))

let fm = factory.getWebSiteCategory(with: "博客")
fm.use(user: User(name: "御坂美琴"))

let fn = factory.getWebSiteCategory(with: "博客")
fn.use(user: User(name: "上条当麻"))

print("网站分类总数\(factory.webSiteCount)个")  ///



//: [Next](@next)
