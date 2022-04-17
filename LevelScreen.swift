//
//  LevelScreen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/12.
//

import SwiftUI

struct LevelScreen: View {
    
    @Binding var isActive : Bool
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var hintNumber: Int

    @State var detectOn: Bool = false
    @State var hintOn: Bool = false
    @State var passLevel: Bool = false
    
    var body: some View{
        ZStack{
            backgroundColor(gameMode: gameMode).edgesIgnoringSafeArea(.all)
            
            // level content
            if currentLevel == 1{
                Level1Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 2{
                Level2Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 3{
                Level3Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 4{
                Level4Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 5{
                Level5Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 6{
                Level6Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 7{
                Level7Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 8{
                Level8Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 9{
                Level9Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 10{
                Level10Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 11{
                Level11Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 12{
                Level12Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 13{
                Level13Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 14{
                Level14Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 15{
                Level15Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 16{
                Level16Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 17{
                Level17Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 18{
                Level18Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            else if currentLevel == 19{
                Level19Screen(gameMode: self.$gameMode,
                             levelProgress: self.$levelProgress,
                             currentLevel: self.$currentLevel,
                             detectOn: self.$detectOn,
                             passLevel: self.$passLevel)
            }
            
            // nav bar
            LevelNavigationBar(isActive: self.$isActive,
                               gameMode: self.$gameMode,
                               currentLevel: self.$currentLevel,
                               hintNumber: self.$hintNumber,
                               detectOn: self.$detectOn,
                               hintOn: self.$hintOn
            )
            
            passLevelView(gameMode: self.$gameMode)
                .offset(x: passLevel ? 0 : screenWidth*2)
                .onTapGesture {
                    currentLevel += 1
                    if currentLevel > levelProgress{
                        levelProgress = currentLevel
                    }
                    passLevel = false
                    hintOn = false
                    detectOn = false
                }
            
        }
        .navigationBarHidden(true)
    }
}
