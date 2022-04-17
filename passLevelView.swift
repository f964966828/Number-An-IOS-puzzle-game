//
//  passLevelView.swift
//  Number
//
//  Created by 恩恩 on 2021/8/9.
//

import SwiftUI

struct passLevelView: View {
    
    @Binding var gameMode: GameMode
    
    var body: some View {
        ZStack{
            textColor(gameMode: gameMode).opacity(0.8).edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Pass level")
                    .font(.system(size: 60, design: .rounded))
                    .foregroundColor(backgroundColor(gameMode: gameMode))
                    .padding()
                
                Text("Tap to continue.")
                    .font(.system(size: 40, design: .rounded))
                    .foregroundColor(backgroundColor(gameMode: gameMode))
                    .padding()
            }
        }
    }
}
