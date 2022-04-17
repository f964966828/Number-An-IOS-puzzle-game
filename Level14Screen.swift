//
//  Level14Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/15.
//

import SwiftUI

struct Level14Screen: View {
    
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var score: Int = 0
    @State var currentIdx: Int = -1
    
    var body: some View {
        VStack{
            Text(String(score))
                .animation(.spring())
                .font(.system(size: 150, design: .rounded))
                .foregroundColor(textColor(gameMode: gameMode))
                .animation(.default)
                .padding()
                .onTapGesture {
                    if detectOn && score == 14{
                        passLevel = true
                    }
                }
            
            HStack{
                ForEach(0...1, id: \.self) { idx in
                    Button(action: {
                        
                        if score == 14 || detectOn{
                            return
                        }
                        
                        if currentIdx == -1{
                            currentIdx = idx
                            score += 1
                        }else if currentIdx != idx{
                            currentIdx = idx
                            score += 1
                        }else{
                            currentIdx = -1
                            score = 0
                        }
                        
                    }, label: {
                        Circle()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                            .padding()
                    })
                }
            }
        }
    }
}
