//
//  Level7Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/12.
//

import SwiftUI

struct Level7Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var position: [CGSize] = [outside,outside,outside,outside,outside,outside,outside,outside,outside,outside]
    @State var rotateDegree: [Double] = [0,0,0,0,0,0,0,0,0,0,0]
    
    @State var isAnimated: [Bool] = [false,false,false,false,false,false,false,false,false,false]
    
    var body: some View {
        
        ZStack{
            ForEach(0...9, id: \.self) { idx in
                VStack{
                    Text(String(idx))
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundColor(textColor(gameMode: gameMode).opacity(0.7))
                }
                .rotationEffect(.degrees(rotateDegree[idx]))
                .offset(x: position[idx].width, y: position[idx].height)
                .onTapGesture {
                    if idx == 7 && detectOn{
                        passLevel = true
                    }
                }
                .onAppear(perform: {

                    if !isAnimated[idx]{
                        isAnimated[idx] = true
                    }else{
                        return
                    }
                    
                    let moveType = Int.random(in: 0...5) % 4
                    // 0: up, 1: down, 2: right, 3: left
                    DispatchQueue.main.asyncAfter(deadline: .now() , execute: {
                        //withAnimation(Animation.default){
                            switch(moveType){
                            case 0:
                                position[idx].width = CGFloat.random(in: -screenWidth/2 ... screenWidth/2)
                                position[idx].height = screenHeight/2 + 100
                                break
                            case 1:
                                position[idx].width = CGFloat.random(in: -screenWidth/2 ... screenWidth/2)
                                position[idx].height = -screenHeight/2 - 100
                                break
                            case 2:
                                position[idx].width = screenWidth/2 + 100
                                position[idx].height = CGFloat.random(in: -screenHeight/2 ... screenHeight/2)
                                break
                            case 3:
                                position[idx].width = -screenWidth/2 - 100
                                position[idx].height = CGFloat.random(in: -screenHeight/2 ... screenHeight/2)
                                break
                            default:
                                break
                            }
                        //}
                    })
                    
                    
                    let time = Double.random(in: 4...8)
                    let startTime = (idx == 7) ? 10 : Double.random(in: 0...4)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + startTime , execute: {
                        withAnimation(Animation.linear(duration: time).repeatForever(autoreverses: false)){
                            switch(moveType){
                            case 0:
                                position[idx].width = CGFloat.random(in: -screenWidth/2 ... screenWidth/2)
                                position[idx].height = -screenHeight/2 - 100
                                break
                            case 1:
                                position[idx].width = CGFloat.random(in: -screenWidth/2 ... screenWidth/2)
                                position[idx].height = screenHeight/2 + 100
                                break
                            case 2:
                                position[idx].width = -screenWidth/2 - 100
                                position[idx].height = CGFloat.random(in: -screenHeight/2 ... screenHeight/2)
                                break
                            case 3:
                                position[idx].width = screenWidth/2 + 100
                                position[idx].height = CGFloat.random(in: -screenHeight/2 ... screenHeight/2)
                                break
                            default:
                                break
                            }
                            
                            rotateDegree[idx] = Double.random(in: 360...480)
                            
                        }
                    })
                
                })
            }
        }
        
    }
}
