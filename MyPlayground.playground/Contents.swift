import UIKit

var str = "Hello, playground"

var someInts = [Int]()

someInts.count


var arr:[Int] = [12,231,4124]
someInts = Array(arr)
var someInt1s = Array<String>()

var s :String?
var string : String? {
    didSet{
        _ = "string has changed"
    }
}

let str3 = "123"
string = str3


someInt1s = ["helo000000","helo2","hello3","helooooo"]
var reverseNames = someInt1s.sorted(by: {(s1:String, s2:String) -> Bool in
    return s1 > s2
})

struct Node {
    var nd1 = 0
    
    mutating func add() {
        nd1 = nd1 + 1
    }
}

class NoDe{
    init() {
        print("init function")
    }
    var itSelf = "hello itSelf"
    var ini: String? {
        get {
            return itSelf
        }
    }
    deinit {
        print("deinited")
    }
    
    
}



