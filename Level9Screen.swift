//
//  Level9Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/11.
//

import SwiftUI

let lv9w = screenWidth/3.5

struct Level9Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var offset: CGSize = .zero
    @State var position: [[CGFloat]] = [[-lv9w,-lv9w],[0,-lv9w],[lv9w,-lv9w],[-lv9w,0],[0,0],[lv9w,0],[-lv9w,lv9w],[0,lv9w],[lv9w,lv9w]]
    
    @State var positionIdx: [Int] = [8,0,5,1,4,2,7,3,6]
    @State var correctState: [Int] = [8,0,1,2,3,4,5,6,7]
    @State var correct: Bool = false
    
    func up(){
        if positionIdx[0] < 6{
            for i in 0...8{
                if positionIdx[i] == positionIdx[0] + 3{
                    positionIdx[i] -= 3
                    positionIdx[0] += 3
                    break
                }
            }
        }
    }
    
    func down(){
        if positionIdx[0] > 2{
            for i in 0...8{
                if positionIdx[i] == positionIdx[0] - 3{
                    positionIdx[i] += 3
                    positionIdx[0] -= 3
                    break
                }
            }
        }
    }
    
    func left(){
        if positionIdx[0] % 3 != 2{
            for i in 0...8{
                if positionIdx[i] == positionIdx[0] + 1{
                    positionIdx[i] -= 1
                    positionIdx[0] += 1
                    break
                }
            }
        }
    }
    
    func right(){
        if positionIdx[0] % 3 != 0{
            for i in 0...8{
                if positionIdx[i] == positionIdx[0] - 1{
                    positionIdx[i] += 1
                    positionIdx[0] -= 1
                    break
                }
            }
        }
    }
    
    private func getDragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                if !detectOn{
                    self.offset = value.translation
                }
            }
            .onEnded { value in
                if !detectOn && !correct{
                    let x = self.offset.width
                    let y = self.offset.height
                    
                    if abs(x) > abs(y){
                        if x > 0{
                            right()
                        }else{
                            left()
                        }
                    }else{
                        if y > 0{
                            down()
                        }else{
                            up()
                        }
                    }
                }
                
                if positionIdx == correctState{
                    correct = true
                }
        }
    }
    
    var body: some View {
        
        ZStack{
            ForEach((0...8), id: \.self) { i in
                ZStack{
                    if i != 0{
                        Image(systemName: "square.fill")
                            .resizable()
                            .frame(width: screenWidth/4, height: screenWidth/4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor((i == 0 && !correct) ? Color.white.opacity(0) : textColor(gameMode: gameMode))
                        Text((i == 0) ? String(9) : String(i))
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor((i == 0 && !correct) ? Color.white.opacity(0) : backgroundColor(gameMode: gameMode))
                    }
                }
                .offset(x: position[positionIdx[i]][0], y: position[positionIdx[i]][1])
                .animation(.spring())
            }
            
            ZStack{
                Image(systemName: "square.fill")
                    .resizable()
                    .frame(width: screenWidth/4, height: screenWidth/4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor((!correct) ? Color.white.opacity(0) : textColor(gameMode: gameMode))
                Text("9")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor((!correct) ? Color.white.opacity(0) : backgroundColor(gameMode: gameMode))
            }
            .offset(x: position[positionIdx[0]][0], y: position[positionIdx[0]][1])
            .onTapGesture {
                if correct && detectOn{
                    passLevel = true
                }
            }
            
        }
        .gesture(getDragGesture())

    }
}
