//
//  ChooseScreen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/8.
//

import SwiftUI

struct ChooseScreen: View{
    
    @Binding var isActive : Bool
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var hintNumber: Int
    
    var body: some View {
        NavigationView{
            ZStack{
                backgroundColor(gameMode: gameMode).edgesIgnoringSafeArea(.all)
                
                VStack{
                    backgroundColor(gameMode: gameMode)
                        .frame(height: screenHeight/10)
                    
                    ScrollView(showsIndicators: false){
                        VStack{
                            ForEach((1...10), id: \.self) { i in
                                HStack{
                                    ForEach((0...2).reversed(), id: \.self) { j in
                                        ZStack{
                                            NavigationLink(
                                                destination:
                                                    LevelScreen(isActive: self.$isActive,
                                                             gameMode: self.$gameMode,
                                                             levelProgress: self.$levelProgress,
                                                             currentLevel: self.$currentLevel,
                                                             hintNumber: self.$hintNumber),
                                                label: {
                                                    numberSquare(number: 3*i-j, gameMode: gameMode)}
                                            )
                                            .simultaneousGesture(TapGesture().onEnded( {currentLevel = 3*i-j}))
                                            .offset(x: levelProgress >= 3*i-j ? 0 : screenWidth)
                                            
                                            squareLock(gameMode: gameMode)
                                                .offset(x: levelProgress >= 3*i-j ? screenWidth : 0)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                SettingNavigationBar(gameMode: self.$gameMode,
                                     isActive: self.$isActive,
                                     barTitle: "Choose Level")
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct numberSquare: View {
    
    var number: Int
    var gameMode: GameMode
    
    var body: some View {
        Image(systemName: String(number) + ".square")
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth/6, height: screenWidth/6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(textColor(gameMode: gameMode))
            .padding()
    }
}

struct squareLock: View {

    var gameMode: GameMode
    
    var body: some View {
        ZStack{
            Image(systemName: "square")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth/6, height: screenWidth/6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor(gameMode: gameMode))
                .padding()
            
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth/10, height: screenWidth/10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor(gameMode: gameMode))
                .padding()
        }
    }
}
