//
//  Level1Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/9.
//

import SwiftUI

struct Level1Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text("1")
                    .font(.system(size: 200, design: .rounded))
                    .foregroundColor(textColor(gameMode: gameMode))
                    .onTapGesture {
                        if detectOn{
                            passLevel = true
                        }
                    }
                Spacer()
                Spacer()
            }
            
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                HStack{
                    Text("Game Rule")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(textColor(gameMode: gameMode))
                }
                .frame(width: screenWidth-50, height: 250, alignment: .bottomLeading)
                
                HStack{
                    Text("1. Try to find the hidden number")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(textColor(gameMode: gameMode))
                }
                .frame(width: screenWidth-50, height: 30, alignment: .bottomLeading)
                
                HStack{
                    Text("2. Number may exists as any form")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(textColor(gameMode: gameMode))
                }
                .frame(width: screenWidth-50, height: 40, alignment: .bottomLeading)
                
                HStack{
                    Text("3. Use ")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(textColor(gameMode: gameMode))
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(
                            ZStack{
                                Circle()
                                    .padding(-7)
                                    .foregroundColor(textColor(gameMode: gameMode))
                                Circle()
                                    .padding(-5)
                                    .foregroundColor(backgroundColor(gameMode: gameMode))
                            }
                        )
                        .foregroundColor(textColor(gameMode: gameMode))
                    
                    
                    Text(" to detect finded number.")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(textColor(gameMode: gameMode))
                }
                .frame(width: screenWidth-50, height: 30, alignment: .leading)
                
                HStack{
                    Text("4. Enjoy playing")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(textColor(gameMode: gameMode))
                }
                .frame(width: screenWidth-50, height: 30, alignment: .leading)
                
                Spacer()
            }
        }
    }
}
