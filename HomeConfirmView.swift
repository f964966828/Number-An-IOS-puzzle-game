//
//  HomeConfirmView.swift
//  Number
//
//  Created by 恩恩 on 2021/8/8.
//

import SwiftUI

struct HomeConfirmView: View {
    
    @Binding var isActive: Bool
    @Binding var gameMode: GameMode
    @Binding var showPopover: Bool
    
    var body: some View {
        ZStack{
            textColor(gameMode: gameMode).opacity(0.8).edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Quit?")
                    .font(.system(size: 75, design: .rounded))
                    .foregroundColor(backgroundColor(gameMode: gameMode))
                    .padding()
                
                HStack{
                    Spacer()
                    
                    Button(action: { isActive = false }, label: {
                        Text("Yes")
                            .font(.system(size: 50, design: .rounded))
                            .foregroundColor(backgroundColor(gameMode: gameMode))
                            .background(
                                ZStack{
                                    Circle()
                                        .padding(-20)
                                        .foregroundColor(backgroundColor(gameMode: gameMode))
                                    Circle()
                                        .padding(-15)
                                        .foregroundColor(textColor(gameMode: gameMode).opacity(0.8))
                                }
                            )
                    })
                    
                    Spacer()
                    
                    Button(action: { showPopover = false }, label: {
                        Text("No")
                            .font(.system(size: 50, design: .rounded))
                            .foregroundColor(backgroundColor(gameMode: gameMode))
                            .background(
                                ZStack{
                                    Circle()
                                        .padding(-20)
                                        .foregroundColor(backgroundColor(gameMode: gameMode))
                                    Circle()
                                        .padding(-15)
                                        .foregroundColor(textColor(gameMode: gameMode).opacity(0.8))
                                }
                            )
                    })
                    
                    Spacer()
                }
            }
        }
        
    }
}
