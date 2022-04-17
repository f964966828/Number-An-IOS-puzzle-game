//
//  MainScreen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/6.
//

import SwiftUI

// enumurations
enum OperationButton{
    case start
    case choose
    case setting
    case contact
    case home
    case detect
    case hint
    
    var buttomContent: String{
        switch self {
        case .start:
            return "Start Game"
        case .choose:
            return "Choose Level"
        case .setting:
            return "Setting"
        case .contact:
            return "Contact Us"
        default:
            return ""
        }
    }
    
    var imageName: String{
        switch  self {
        case .start:
            return "play.fill"
        case .choose:
            return "list.bullet"
        case .setting:
            return "ellipsis"
        case .contact:
            return "envelope"
        case .home:
            return "house.fill"
        case .detect:
            return "magnifyingglass"
        case .hint:
            return "lightbulb.fill"
        }
    }
}

enum GameMode{
    case brightMode
    case darkMode
}

// functions
func textColor(gameMode: GameMode) -> Color {
    if gameMode == .brightMode {
        return Color(UIColor(red: 30/255.0, green:30/255.0
                             , blue:30/255.0, alpha: 1))
    }else{
        return Color(UIColor(red: 240/255.0, green:240/255.0
                             , blue:240/255.0, alpha: 1))
    }
}

func backgroundColor(gameMode: GameMode) -> Color {
    if gameMode == .brightMode {
        return Color(UIColor(red: 240/255.0, green:240/255.0
                             , blue:240/255.0, alpha: 1))
    }else{
        return Color(UIColor(red: 30/255.0, green:30/255.0
                             , blue:30/255.0, alpha: 1))
    }
}

// constants
var screenWidth = UIScreen.main.bounds.width
var screenHeight = UIScreen.main.bounds.height

// main screen
struct MainScreen: View {
    
    // parameters
    @State var gameMode: GameMode = .darkMode
    @State var levelProgress: Int = 1
    @State var currentLevel: Int = 1
    @State var hintNumber: Int = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                backgroundColor(gameMode: gameMode).edgesIgnoringSafeArea(.all)
                
                
                BackgroundView(gameMode: self.$gameMode)
                
                
                VStack{
                    Text("Number")
                        .font(.system(size: 75, weight: .bold, design: .rounded))
                        .frame(height: screenHeight/5, alignment: .top)
                        .foregroundColor(textColor(gameMode: gameMode))
                        .padding()
                    
                    ButtonScreen(gameMode: self.$gameMode,
                                 levelProgress: self.$levelProgress,
                                 currentLevel: self.$currentLevel,
                                 hintNumber: self.$hintNumber
                    )
                    
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
