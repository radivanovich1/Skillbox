import Foundation
// 2 Pure Function - это функция которая всегда возвращает одинаковый результат для одного и того же набора входных значений.


//3
var arr: [Int] = [5, 6, 3, 2, 1]
arr = arr.sorted()

//4
var stringArr: [String] = []
stringArr = arr.map(){ String($0) }
stringArr

//5
let names: [String] = ["Nick", "Mike"]
var strNames = names.reduce("") { "\($0) \($1)" }
strNames

//6
func hello(){
    print("hi!")
}

func someFunc(_ pr: () -> Void)  {
    do {
        sleep(2)
    }
    pr()
}

someFunc(hello)

//7
func hello2( _ f: ()-> Void, _ s: ()-> Void ){
    f()
    s()
}

func twoFunc(_ f: () -> Void, _ s: () -> Void) -> Void {
    
    return hello2(f, s)
}

twoFunc(hello, hello)


//8
func srt(a: Int, b: Int)-> Bool{
    if a < b{ return true}
    else {return false}
}

func bubbleWhile(arr: inout [Int], f: ( Int, Int)-> Bool)-> [Int] {
    var i = arr.count - 1
    while(i > 0) {
        var j = 0
        while(j < i) {
            if f( arr[j], arr[j + 1]) {
                arr.swapAt(j, j + 1)
            }
            j += 1
        }
        i -= 1
    }
    return arr
}

bubbleWhile(arr: &arr, f: srt(a:b:))

//9.инфиксный - вставляется между двумя операндами (a + b)
//  префиксный - предшествует операнду  (-a)
//  постфиксный - следует за операндом (b!)
