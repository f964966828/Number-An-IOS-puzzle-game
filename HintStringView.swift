//
//  HintAssociatedScreen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/8.
//

import SwiftUI

let hintString: [Int : String] = [
    1: "Just hit on the big '1'",
    2: "'2' is at the bottom",
    3: "Form the shape of '3'",
    4: "Hit the button for 4 times",
    5: "Spell 'FIVE'",
    6: "6 in Roman numbers is 'VI'",
    7: "Wait for few seconds will 7 appear",
    8: "Form the shape of '8'",
    9: "→ ↓ ← ↓ → ↑ ↑ → ↓ ← ← ↑",
    10: "Form the shape of '10'",
    11: "Try to get the score up to 11",
    12: "Choose pairs of same image",
    13: "13 in binary code is '1101'",
    14: "Hit two buttons iteratively",
    15: "Form a horizental '15'",
    16: "test",
    17: "test",
    18: "test",
    19: "test",
    20: "test",
    21: "test",
    22: "test",
    23: "test",
    24: "test",
    25: "test",
    26: "test",
    27: "test",
    28: "test",
    29: "test",
    30: "Be patient"
]

struct hintStringView: View{
    
    @Binding var gameMode: GameMode
    @Binding var hintOn: Bool
    @Binding var currentLevel: Int
    
    
    var body: some View {
        ZStack{
            (hintOn ? textColor(gameMode: gameMode).opacity(0.7) : Color.white.opacity(0))
                .frame(width: screenWidth*5/6, height: 25, alignment: .top)
                .cornerRadius(30)
            HStack{
                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20, alignment: .leading)
                    .foregroundColor(hintOn ? backgroundColor(gameMode: gameMode) : Color.white.opacity(0))
                Text(hintString[currentLevel]!)
                    .foregroundColor(hintOn ? backgroundColor(gameMode: gameMode) : Color.white.opacity(0))
            }
        }
    }
}
