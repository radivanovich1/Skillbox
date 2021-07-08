import UIKit
//4
//протоколы описывют требования и не имеют реализации,  классы наследуясь от протокола должны реализовать всё что в нём описано

//5
//a - да, b - да,  c - да,  d - нет

//6a
protocol ComputerDelegate{
    func computerMoveMessage(from: (Character, Int) , to: (Character, Int))
}
protocol Engine {
    func userMoveMessage(from: (Character, Int) , to: (Character, Int))
    var rate: Double {get}
    var delegate: ComputerDelegate {get set}
}
//6b
protocol Flyable{
    func fly()
}
protocol Drawable{
    func draw()
}

class Bird: Flyable, Drawable{
    func fly() {
        print("flying")
    }
    func draw() {
        print("drawing")
    }
}

//7
extension CGRect{
    func getCenter()-> CGPoint
    {
        return CGPoint(x: self.midX, y: self.midY)
    }
    func  square() -> Float {
        return Float(self.height * self.width)
    }
    
}
extension UIView{
    func anim(){
        UIView.animate(withDuration: 10){
            self.alpha = 0
        }
    }
}
extension Comparable{
    func bound(minValue: Self , maxValue: Self) -> Any{
        let res = self
        if res >= minValue && res <= maxValue  {
            return res
        }
        else if res < minValue {
            return minValue
        }
        else if res > maxValue {
            return maxValue
        }
        else {return self }
    }

}
7.bound(minValue: 10, maxValue: 21)

extension Array where Element == Int  {
      func summ() -> Int {
        return self.reduce(0, +)
    }
}
[1,2,3,3].summ()


//8 использованиие протоколов с расширениями вместе со структурами вместо использования классов с наследованием
