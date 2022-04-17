//
//  Level8Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/10.
//

import SwiftUI

struct Level8Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var currentIdx: Int = 7
    @State var state: [Bool] = [false,false,false,false,false,false,false,true,false,false,false,false,false,false,false]
    
    var correctState1: [Bool] = [true,true,true,true,false,true,true,true,true,true,false,true,true,true,true]
    var correctState2: [Bool] = [false,false,false,false,true,false,false,false,false,false,true,false,false,false,false]
    
    func up() {
        if !detectOn && currentIdx > 2{
            currentIdx -= 3
            state[currentIdx].toggle()
        }
    }
    
    func down(){
        if !detectOn && currentIdx < 12{
            currentIdx += 3
            state[currentIdx].toggle()
        }
    }
    
    func left(){
        if !detectOn && currentIdx % 3 != 0{
            currentIdx -= 1
            state[currentIdx].toggle()
        }
    }
    
    func right(){
        if !detectOn && currentIdx % 3 != 2{
            currentIdx += 1
            state[currentIdx].toggle()
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            ForEach((0...4), id: \.self) { i in
                HStack{
                    ForEach((0...2), id: \.self) { j in
                        (state[i*3+j] ? .orange : textColor(gameMode: gameMode))
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(5)
                            .padding(2)
                    }
                }
            }
            .onTapGesture {
                if detectOn && (state == correctState1 || state == correctState2){
                    passLevel = true
                }
            }
            
            VStack{
                Button(action: { up() }, label: {
                    CircleButtonView(gameMode: gameMode)
                })
                
                HStack{
                    Spacer()
                    Button(action: { left() }, label: {
                        CircleButtonView(gameMode: gameMode)
                    })
                    Spacer()
                    Button(action: { right() }, label: {
                        CircleButtonView(gameMode: gameMode)
                    })
                    Spacer()
                }
                
                Button(action: { down() }, label: {
                    CircleButtonView(gameMode: gameMode)
                })
            }
            .frame(height: screenHeight/3, alignment: .center)
            
        }
    }
    
    struct CircleButtonView: View {
        
        var gameMode: GameMode
        
        var body: some View {
            Circle()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor(gameMode: gameMode))
                .background(
                    ZStack{
                        Circle()
                            .padding(-8)
                            .foregroundColor(textColor(gameMode: gameMode))
                        Circle()
                            .padding(-4)
                            .foregroundColor(backgroundColor(gameMode: gameMode))
                    }
                )
                
        }
    }
}
