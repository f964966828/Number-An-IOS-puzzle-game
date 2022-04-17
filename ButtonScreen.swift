//
//  ButtonScreen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/6.
//

import SwiftUI

struct ButtonScreen: View {
    
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var hintNumber: Int
    
    @State var startIsActive : Bool = false
    @State var chooseIsActive : Bool = false
    @State var settingIsActive : Bool = false
    @State var contactIsActive : Bool = false
    
    //let buttons: [OperationButton] = [.start, .choose, .setting, .contact ]
    let startButton: OperationButton = .start
    let chooseButton: OperationButton = .choose
    let settingButton: OperationButton = .setting
    let contactButton: OperationButton = .contact
    
    var body: some View {
        VStack{
            // start button
            HStack{
                NavigationLink(
                    destination: LevelScreen(isActive: self.$startIsActive,
                                             gameMode: self.$gameMode,
                                             levelProgress: self.$levelProgress,
                                             currentLevel: self.$currentLevel,
                                             hintNumber: self.$hintNumber
                                    ),
                    isActive: self.$startIsActive,
                    label: {
                        Button(action: {
                            self.startIsActive = true
                        }, label: {
                            ButtonWithBorder(gameMode: self.$gameMode,
                                             button: startButton)
                        })
                })
                .simultaneousGesture(TapGesture().onEnded( { currentLevel = levelProgress}))
                
                Text((levelProgress == 1) ? "Start" : "Continue")
                    .font(.system(size: 28))
                    .frame(width: screenWidth/2, alignment: .leading)
                    .foregroundColor(textColor(gameMode: gameMode))
            }
            
            // choose button
            HStack{
                NavigationLink(
                    destination: ChooseScreen(isActive: self.$chooseIsActive,
                                              gameMode: self.$gameMode,
                                              levelProgress: self.$levelProgress,
                                              currentLevel: self.$currentLevel,
                                              hintNumber: self.$hintNumber
                                     ),
                    isActive: self.$chooseIsActive,
                    label: {
                        Button(action: {
                            self.chooseIsActive = true
                        }, label: {
                            ButtonWithBorder(gameMode: self.$gameMode,
                                             button: chooseButton)
                        })
                })
                
                Text(chooseButton.buttomContent)
                    .font(.system(size: 28))
                    .frame(width: screenWidth/2, alignment: .leading)
                    .foregroundColor(textColor(gameMode: gameMode))
            }
            
            // setting button
            HStack{
                NavigationLink(
                    destination: SettingScreen(isActive: self.$settingIsActive,
                                             gameMode: self.$gameMode
                                    ),
                    isActive: self.$settingIsActive,
                    label: {
                        Button(action: {
                            self.settingIsActive = true
                        }, label: {
                            ButtonWithBorder(gameMode: self.$gameMode,
                                             button: settingButton)
                        })
                })
                
                Text(settingButton.buttomContent)
                    .font(.system(size: 28))
                    .frame(width: screenWidth/2, alignment: .leading)
                    .foregroundColor(textColor(gameMode: gameMode))
            }
            
            // contact button
            HStack{
                NavigationLink(
                    destination: Text("Havn't done"),
                    isActive: self.$contactIsActive,
                    label: {
                        Button(action: {
                            self.contactIsActive = true
                        }, label: {
                            ButtonWithBorder(gameMode: self.$gameMode,
                                             button: contactButton)
                        })
                })
                
                Text(contactButton.buttomContent)
                    .font(.system(size: 28))
                    .frame(width: screenWidth/2, alignment: .leading)
                    .foregroundColor(textColor(gameMode: gameMode))
            }
        }
    }
}

struct ButtonWithBorder: View {
    
    @Binding var gameMode: GameMode
    var button: OperationButton
    
    var body: some View {
        Image(systemName: button.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth/12, height: screenWidth/12)
            .padding()
            .foregroundColor(textColor(gameMode: gameMode))
            .cornerRadius(100)
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
            .padding(15)
    }
}
