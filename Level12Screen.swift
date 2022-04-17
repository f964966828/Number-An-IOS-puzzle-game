//
//  Level12Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/15.
//

import SwiftUI

struct Level12Screen: View {
    
    @State var imageName: [String] = [
        "arrow.up.circle.fill",
        "arrow.down.circle.fill",
        "arrow.left.circle.fill",
        "arrow.right.circle.fill",
        "arrow.up.left.circle.fill",
        "arrow.up.right.circle.fill",
        "arrow.down.left.circle.fill",
        "arrow.down.right.circle.fill",
        "arrow.up.arrow.down.circle.fill",
        "arrow.right.arrow.left.circle.fill",
        "arrow.uturn.up.circle.fill",
        "arrow.uturn.down.circle.fill"
    ]
    
    @State var maze: [[Int]] = [
        [7, 3, 0, 6],
        [2, 10, 9, 5],
        [9, 1, 8, 11],
        [6, 4, 0, 1],
        [2, 10, 4, 11],
        [7, 5, 3, 8]]
    
    @State var state: [[Bool]] = [
        [false,false,false,false],
        [false,false,false,false],
        [false,false,false,false],
        [false,false,false,false],
        [false,false,false,false],
        [false,false,false,false]]
    
    @State var point: [Int] = [-1,-1]
    
    @State var score: Int = 0
    
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text(String(score))
                .font(.system(size: 100, design: .rounded))
                .foregroundColor(textColor(gameMode: gameMode))
                .onTapGesture {
                    if detectOn && score == 12{
                        passLevel = true
                    }
                }
            
            ForEach(0...5, id: \.self) { i in
                HStack{
                    ForEach(0...3, id: \.self) { j in
                        let idx =  maze[Int(i)][Int(j)]
                        Button(action: {
                            
                            if state[i][j]{
                                return
                            }
                            
                            if point == [-1,-1]{
                                point = [i, j]
                            }else{
                                
                                if point == [i,j]{
                                    point = [-1,-1]
                                    return
                                }
                                
                                if maze[point[0]][point[1]] == maze[i][j] {
                                    state[point[0]][point[1]] = true
                                    state[i][j] = true
                                    score += 1
                                }
                                point = [-1,-1]
                            }
                        }, label: {
                            Image(systemName: imageName[idx])
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth/6.5)
                                .foregroundColor(backgroundColor(gameMode: gameMode).opacity(([i, j] == point) ? 0.4 : 1).opacity(state[i][j] ? 0 : 1))
                                .background(
                                    ZStack{
                                        Circle()
                                            .padding(-3)
                                            .foregroundColor(textColor(gameMode: gameMode).opacity(state[i][j] ? 0 : 1))
                                    }
                                )
                                .padding(4)
                        })
                    }
                }
            }
            
        }
    }
}
