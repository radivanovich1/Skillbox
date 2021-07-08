import UIKit
import Foundation

//4
//дженерики нужны для работы с различными типами данных без изменения реализации

//5
//ассоциированные типы используются в протоколах

//6a
func eq<T: Equatable>(_ a: T, _ b: T){
    if a == b {
        print("true")
    }  else{
        print("false")
    }
    
}
eq("1","1")

//6b

func compare<T: Comparable>(_ a: T, _ b: T){
    if a > b {
        print(a)
    }
    else if a < b {
        print(b)
    }
    else {
        print("a=b")
    }
}
compare(4,2)

//6c
var a = 6
var b = 4
func compare2<T: Comparable>(_ a: inout T, _ b: inout T){
    var temp: T
    if a > b {
        temp = a
        a = b
        b = temp
    }
}
compare2(&a, &b)
a
b



//6d
func f1<T>(a: T){
    print(a)
}

func f2<T>(b: T){
    print(b)
}

func someFunc<T>(_ a: @escaping (T) -> Void, _ b: @escaping (T) -> Void) -> (T) -> Void{
    
    return { (_ param: T) -> () in a(param)
        b(param) }
}

someFunc(f1(a:), f2(b:))(1)


//let sum = {
//    (x: [Int]) -> Int in
//    var summ = 0
//    for el in x {
//        summ += el
//    }
//    return summ
//}
//
//sum([1,2,3])



//7a

extension Array where Element: Comparable{
    
    var maxElement: Element? {
        return self.max()
    }
    
}
var arrw: [String] = []
arrw.maxElement

//7b

extension Array where Element: Equatable{
    mutating func del(){
        var result = [Element]()
        for  value in self {
        if result.contains(value) == false {
            result.append(value)
        }
        }
        self = result
        }
}
var arr = [1,2,1,4,2]
arr.del()

//8a

infix operator ^^
func ^^(left: Int, right: Int)-> Double{
    return pow(Double(left), Double( right))
}
2^^3

//8b

var right = 0
infix operator ~>
func ~>(left: Int, right: inout Int){
    
    right = left * 2
}
8 ~> right

//8c

infix operator <*
func <*(left: UIViewController , right: UITableView){

    if left is UITableViewDelegate{
        right.delegate = left as? UITableViewDelegate
    }
}
var myController = UIViewController()
var tableView = UITableView()

myController <* tableView

//8d
struct Str<T> {
    let x: T
}
extension Str: CustomStringConvertible {
    var description: String {
        return "\(x)"
    }
}
let p = Str(x: 21)
let pp = Str(x: "string")

func +(left: CustomStringConvertible, right: CustomStringConvertible) -> String{
    
   return "\(left)\(right)"
     
}
p + pp

//9
protocol Animator{
    associatedtype Target
    associatedtype Value
    init(_ value: Value)
    func animate(target: Target)
}

class BackgroundAnimator: Animator{
    let newValue: UIColor
    required init(_ value: UIColor){
        newValue = value
    }
    func animate(target: UIView) {
        UIView.animate(withDuration: 0.4){
            target.backgroundColor = self.newValue
        }
    }
}
class CenterAnimator: Animator {
    let newValue: CGPoint
    required init(_ value: CGPoint){
        newValue = value
    }
    func animate(target: UIView) {
        UIView.animate(withDuration: 0.4){
            target.center = self.newValue
        }
    }
}
class ScaleAnimator: Animator {
    let newValue:CGFloat
    required init(_ value: CGFloat){
        newValue = value
    }
    func animate(target: UIView) {
        UIView.animate(withDuration: 0.4){
            target.transform.scaledBy(x: self.newValue, y: self.newValue)
        }
    }
}
infix operator ~~>
   func ~~> <T: Animator>(left: T, right: T.Target){
    left.animate(target: right)
}
