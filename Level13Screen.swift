//
//  Level13Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/15.
//

import SwiftUI

struct Level13Screen: View {
    
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var correct: Bool = false
    @State var state: [Bool] = [false,false,false,false,false]
    @State var correctState1: [Bool] = [false,true,true,false,true]
    @State var correctState2: [Bool] = [true,false,false,true,false]
    
    var body: some View {
        VStack{
            
            Text("13")
                .animation(.spring())
                .font(.system(size: 150, design: .rounded))
                .foregroundColor(textColor(gameMode: gameMode).opacity(correct ? 1 : 0))
                .padding()
                .onTapGesture {
                    if detectOn && correct{
                        passLevel = true
                    }
                }
            
            HStack{
                ForEach(0...4, id: \.self) { idx in
                    Button(action: {
                        
                        if detectOn{
                            return
                        }
                        
                        state[idx].toggle()
                        correct = (state == correctState1) || (state == correctState2)
        
                    }, label: {
                        Circle()
                            .frame(width: screenWidth/8, height: screenWidth/8)
                            .foregroundColor(textColor(gameMode: gameMode).opacity(state[idx] ? 0.5 : 1))
                            .background(
                                ZStack{
                                    Circle()
                                        .padding(-6)
                                        .foregroundColor(textColor(gameMode: gameMode))
                                    Circle()
                                        .padding(-3)
                                        .foregroundColor(backgroundColor(gameMode: gameMode))
                                }
                            )
                            .padding(8)
                    })
                }
            }
            
        }
    }
}
