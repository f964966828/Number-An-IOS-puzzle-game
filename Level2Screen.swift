//
//  Level2Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/10.
//

import SwiftUI

struct Level2Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var offset: [CGSize] = [.zero,.zero,.zero,.zero,.zero,.zero,.zero,.zero,.zero,.zero]
    @State var position: [CGSize] = [.zero,.zero,.zero,.zero,.zero,.zero,.zero,.zero,.zero,.zero]
    
    private func getDragGesture(for idx: Int) -> some Gesture {
        DragGesture()
            .onChanged { value in
                if !detectOn{
                    self.offset[idx].width = value.translation.width + position[idx].width
                    self.offset[idx].height = value.translation.height + position[idx].height
                }
            }
            .onEnded { value in
                if !detectOn{
                    self.position[idx] = self.offset[idx]
                }
            }
        }
    
    var body: some View {
        
        
        ZStack{
            
            ForEach((0...9), id: \.self) { idx in
                if idx != 2{
                    Text(String(idx))
                        .font(.system(size: 150, weight: .bold, design: .rounded))
                        .foregroundColor(textColor(gameMode: gameMode).opacity(0.8))
                        .offset(x: offset[idx].width, y:offset[idx].height)
                        .gesture(getDragGesture(for: idx))
                }else{
                    Text(String(idx))
                        .font(.system(size: 150, weight: .bold, design: .rounded))
                        .foregroundColor(textColor(gameMode: gameMode).opacity(0.8))
                        .offset(x: offset[idx].width, y:offset[idx].height)
                        .gesture(getDragGesture(for: idx))
                        .onTapGesture {
                            if detectOn{
                                passLevel = true
                            }
                        }
                }
            }
        
        }
    }
}
