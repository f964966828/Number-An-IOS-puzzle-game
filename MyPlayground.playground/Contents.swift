import UIKit

var path: [[Int]] = [[0,0], [0,1], [0,2]]

let index = path.firstIndex(of: [0,0])

let index1 = path.firstIndex(of: [0,3])

if index != nil{
    print("true")
}
