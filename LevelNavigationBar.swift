//
//  LevelNavigationBar.swift
//  Number
//
//  Created by 恩恩 on 2021/8/6.
//

import SwiftUI

var homeButton = OperationButton.home
var detectButton = OperationButton.detect
var hintButton = OperationButton.hint

struct HomeButtonScreen: View {
    
    @Binding var gameMode: GameMode
    
    var body: some View {
        Image(systemName: homeButton.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth/8, height: screenWidth/8, alignment: .leading)
            .padding()
            .foregroundColor(textColor(gameMode: gameMode))
    }
}

struct DetectButtonScreen: View {
    
    @Binding var detectOn: Bool
    @Binding var gameMode: GameMode
    
    var body: some View {
        Image(systemName: detectButton.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth/12, height: screenWidth/12)
            .padding(10)
            .foregroundColor(textColor(gameMode: gameMode))
            .cornerRadius(100)
            .background(
                ZStack{
                    Circle()
                        .padding(-4)
                        .foregroundColor(detectOn ? .orange : textColor(gameMode: gameMode))
                        .shadow(color: .yellow, radius: detectOn ? 4 : 0)
                    Circle()
                        .padding(-1)
                        .foregroundColor(backgroundColor(gameMode: gameMode))
                }
            )
    }
}

struct HintButtonScreen: View {
    
    @Binding var hintOn: Bool
    @Binding var gameMode: GameMode
    
    var body: some View {
        Image(systemName: hintButton.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth/12, height: screenWidth/12)
            .padding(10)
            .foregroundColor(textColor(gameMode: gameMode))
            .cornerRadius(100)
            .background(
                ZStack{
                    Circle()
                        .padding(-4)
                        .foregroundColor(hintOn ? .orange : textColor(gameMode: gameMode))
                        .shadow(color: .yellow, radius: hintOn ? 4 : 0)
                    Circle()
                        .padding(-1)
                        .foregroundColor(backgroundColor(gameMode: gameMode))
                }
            )
            .frame(width: screenWidth/6, alignment: .center)
    }
}

struct LevelNavigationBar: View {
    
    @Binding var isActive : Bool
    @Binding var gameMode: GameMode
    @Binding var currentLevel: Int
    @Binding var hintNumber: Int
    @Binding var detectOn: Bool
    @Binding var hintOn: Bool
    
    
    @State var showPopover: Bool = false

    let buttons: [OperationButton] = [.detect, .hint]
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    HStack{
                        Button(action: { self.showPopover = true },
                             label: { HomeButtonScreen(gameMode: self.$gameMode) })
                    }
                    .frame(width: screenWidth/4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Text(String(currentLevel))
                        .font(.system(size: 75, weight: .bold, design: .rounded))
                        .foregroundColor(textColor(gameMode: gameMode))
                        .padding()
                    
                    Spacer()
                    
                    HStack{
                        Button(action: { detectOn.toggle() }, label: {
                            DetectButtonScreen(detectOn: self.$detectOn, gameMode: self.$gameMode)
                        })
                        
                        Button(action: { hintOn.toggle() }, label: {
                            HintButtonScreen(hintOn: self.$hintOn, gameMode: self.$gameMode)
                        })
                    }
                    .frame(width: screenWidth/4, alignment: .trailing)
                    
                }
                .frame(width: screenWidth, alignment: .bottom)
                
                hintStringView(gameMode: self.$gameMode, hintOn: self.$hintOn, currentLevel: self.$currentLevel)
                    .offset(y: -20)
                
                Spacer()
            }
            
            HomeConfirmView(isActive: self.$isActive,
                            gameMode: self.$gameMode,
                            showPopover: self.$showPopover)
                .offset(x: showPopover ? 0 : screenWidth)
        }
    }
}
