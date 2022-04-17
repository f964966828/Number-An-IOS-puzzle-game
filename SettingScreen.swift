//
//  SettingScreen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/7.
//

import SwiftUI

struct SettingScreen: View{
    
    @Binding var isActive : Bool
    @Binding var gameMode: GameMode
    
    @State var soundValue: CGFloat = 100
    
    var body: some View{
        ZStack{
            backgroundColor(gameMode: gameMode).edgesIgnoringSafeArea(.all)
            
            SettingNavigationBar(gameMode: self.$gameMode,
                                 isActive: self.$isActive,
                                 barTitle: "Setting")

            VStack{
             
                HStack{
                    Text("Sounds")
                        .padding()
                        .font(.system(size: 35, weight: .bold, design: .monospaced))
                        .foregroundColor(textColor(gameMode: gameMode))
                    Spacer()
                }
                .frame(height: screenHeight/5, alignment: .bottom)
                
                HStack{
                    Image(systemName: soundImageName())
                        .resizable()
                        .scaledToFill()
                        .frame(width: screenWidth/10, height: screenWidth/10, alignment: .leading)
                        .padding()
                        .foregroundColor(textColor(gameMode: gameMode))
                    
                    Slider(value: self.$soundValue, in: 0...100)
                        .frame(width: screenWidth*5/7)
                        .accentColor(textColor(gameMode: gameMode))
                        //.shadow(color: textColor(gameMode: gameMode), radius: 5)
                }
                
                HStack{
                    Text("Gamemode")
                        .padding()
                        .font(.system(size: 35, weight: .bold, design: .monospaced))
                        .foregroundColor(textColor(gameMode: gameMode))
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    VStack{
                        HStack{
                            Text(detectGamemode(detectGamemode: .brightMode) + " Bright mode")
                                .padding()
                                .font(.system(size: 25, weight: .bold, design: .monospaced))
                                .foregroundColor(textColor(gameMode: gameMode))
                        }
                        .frame(width: screenWidth*5/7, alignment: .leading)
                        
                        HStack{
                            Text(detectGamemode(detectGamemode: .darkMode) + " Drak mode")
                                .padding()
                                .font(.system(size: 25, weight: .bold, design: .monospaced))
                                .foregroundColor(textColor(gameMode: gameMode))
                        }
                        .frame(width: screenWidth*5/7, alignment: .leading)
                    }
                    Button(action: { changeGamemode() },
                        label: {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth/8, height: screenWidth/6, alignment: .leading)
                            .background(backgroundColor(gameMode: gameMode))
                            .foregroundColor(textColor(gameMode: gameMode))
                    })
                    Spacer()
                    Spacer()
                }
                
                Spacer()
                Spacer()
            }
            
        }
    }
    
    func soundImageName() -> String {
        if soundValue == 0{
            return "speaker.slash.fill"
        }else if soundValue < 50{
            return "speaker.1.fill"
        }else if soundValue < 100{
            return "speaker.2.fill"
        }else{
            return "speaker.3.fill"
        }
    }
    
    func detectGamemode(detectGamemode: GameMode) -> String{
        if detectGamemode == gameMode {
            return "#"
        }else{
            return " "
        }
    }
    
    func changeGamemode() -> Void{
        if gameMode == .brightMode{
            gameMode = .darkMode
        }else{
            gameMode = .brightMode
        }
    }
}
