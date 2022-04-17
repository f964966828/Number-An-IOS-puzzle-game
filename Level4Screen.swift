//
//  Level4Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/9.
//

import SwiftUI

struct Level4Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var number: Int = 0
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            Text(String(number))
                .font(.system(size: 200, design: .rounded))
                .foregroundColor(textColor(gameMode: gameMode))
                .onTapGesture {
                    if detectOn && number == 4{
                        passLevel = true
                    }
                }
            
            Button(action: {
                if !detectOn && number != 4{
                    number += 1
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
            })
            
            Spacer()
        }
    }
}
