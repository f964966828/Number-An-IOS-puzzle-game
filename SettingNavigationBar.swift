//
//  SettingNavigationBar.swift
//  Number
//
//  Created by 恩恩 on 2021/8/7.
//

import SwiftUI

struct SettingNavigationBar: View {
    
    @Binding var gameMode: GameMode
    @Binding var isActive: Bool
    var barTitle: String
    
    var body: some View {
        VStack{
            
            // nav bar
            HStack{
                HStack{
                    Button(action: { self.isActive = false },
                           label: { HomeButtonScreen(gameMode: self.$gameMode) })
                }
                .frame(width: screenWidth/4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                
                Text(barTitle)
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .foregroundColor(textColor(gameMode: gameMode))
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(width: screenWidth)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
