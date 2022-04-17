//
//  Level6Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/9.
//

import SwiftUI

struct Level6Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    let string: [String] = ["B","E","L","I","E","V","E","I","N","Y","O","U","R","S","E","L","F"]
    @State var state: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @State var answerString: String = ""
    @State var arrangement: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    
    func updateString() -> Void {
        var temp: String = ""
        for i in (0...16){
            let idx = arrangement[i]
            if state[idx]{
                temp += string[idx]
            }
        }
        answerString = temp
    }
    
    func reset() -> Void {
        if !detectOn{
            state = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
            answerString = ""
        }
    }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                HStack{
                    ForEach((0...6), id: \.self) { idx in
                        Text(string[idx])
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(state[idx] ? .orange : textColor(gameMode: gameMode))
                            .onTapGesture {
                                if detectOn{
                                    
                                }else if !state[idx]{
                                    state[idx] = true
                                    
                                    if let index = arrangement.firstIndex(of: idx){
                                        arrangement.remove(at: index)
                                        arrangement.append(idx)
                                    }
                                    
                                    updateString()
                                    
                                }else{
                                    state[idx] = false
                                    
                                    updateString()
                                }
                            }
                    }
                }
                .frame(height: screenHeight/10, alignment: .bottom)
                HStack{
                    ForEach((7...8), id: \.self) { idx in
                        Text(string[idx])
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(state[idx] ? .orange : textColor(gameMode: gameMode))
                            .onTapGesture {
                                if detectOn{
                                    
                                }else if !state[idx]{
                                    state[idx] = true
                                    
                                    if let index = arrangement.firstIndex(of: idx){
                                        arrangement.remove(at: index)
                                        arrangement.append(idx)
                                    }
                                    
                                    updateString()
                                    
                                }else{
                                    state[idx] = false
                                    
                                    updateString()
                                }
                            }
                    }
                }
                .frame(height: screenHeight/10, alignment: .bottom)
                HStack{
                    ForEach((9...16), id: \.self) { idx in
                        Text(string[idx])
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(state[idx] ? .orange : textColor(gameMode: gameMode))
                            .onTapGesture {
                                if detectOn{
                                    
                                }else if !state[idx]{
                                    state[idx] = true
                                    
                                    if let index = arrangement.firstIndex(of: idx){
                                        arrangement.remove(at: index)
                                        arrangement.append(idx)
                                    }
                                    
                                    updateString()
                                    
                                }else{
                                    state[idx] = false
                                    
                                    updateString()
                                }
                            }
                    }
                }
                .frame(height: screenHeight/10, alignment: .bottom)
                
                Button(action: { reset() }, label: {
                    ZStack{
                        textColor(gameMode: gameMode)
                            .frame(width: screenWidth*1/2, height: 50, alignment: .top)
                            .cornerRadius(30)
                        Text("Reset")
                            .font(.system(size: 30))
                            .foregroundColor(backgroundColor(gameMode: gameMode))
                    }
                })
                .frame(height: screenHeight/6, alignment: .top)
                
                Spacer()
            }
            
            VStack{
                Spacer()
                
                HStack{
                    Text(answerString)
                        .underline()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(textColor(gameMode: gameMode))
                        .padding()
                }
                .frame(height: screenHeight/3.5, alignment: .top)
                .onTapGesture {
                    if detectOn && answerString == "VI"{
                        passLevel = true
                    }
                }
            }
        }
    }
}
