//
//  Level10Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/13.
//

import SwiftUI

let w10: CGFloat = screenWidth/4
let h10: CGFloat = screenHeight/8

struct Level10Screen: View {
    
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var pointPosition: [[CGFloat]] = [[-w10,-h10],[0,-h10],[w10,-h10],[-w10,h10],[0,h10],[w10,h10]]
    @State var pointStateIdx: Int = 7
    @State var pointState: [Bool] = [false, false, false, false, false, false]
    @State var lineState: [[Bool]] = [
        [false,false,false,false,false,true],
        [false,false,false,false,false,false],
        [false,false,false,true,false,false],
        [false,false,true,false,false,false],
        [false,false,false,false,false,false],
        [true,false,false,false,false,false] ]
    
    @State var correctLineState: [[Bool]] = [
        [false,false,false,true,false,false],
        [false,false,true,false,true,false],
        [false,true,false,false,false,true],
        [true,false,false,false,false,false],
        [false,true,false,false,false,true],
        [false,false,true,false,true,false] ]
    
    var body: some View {
        ZStack{
            ForEach(0...5, id: \.self) { idx in
                Circle()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(pointState[idx] ? .orange : textColor(gameMode: gameMode))
                    .background(
                        ZStack{
                            Circle()
                                .padding(-4)
                                .foregroundColor(textColor(gameMode: gameMode))
                            Circle()
                                .padding(-2)
                                .foregroundColor(backgroundColor(gameMode: gameMode))
                        }
                    )
                    .offset(x: pointPosition[idx][0], y: pointPosition[idx][1])
                    .onTapGesture {
                        if pointStateIdx == 7{
                            pointState[idx] = true
                            pointStateIdx = idx
                        }else{
                            if pointStateIdx == idx{
                                pointState[idx] = false
                                pointStateIdx = 7
                            }else{
                                lineState[idx][pointStateIdx].toggle()
                                lineState[pointStateIdx][idx].toggle()
                                pointState[pointStateIdx] = false
                                pointStateIdx = 7
                            }
                        }
                    }
            }
            
            ForEach(0...35, id: \.self) { idx in
                let i = idx/6
                let j = idx%6
                
                if i < j && lineState[i][j]{
                    let dx = (pointPosition[i][0] - pointPosition[j][0])
                    let dy = (pointPosition[i][1] - pointPosition[j][1])
                    let distance = sqrt(dx*dx + dy*dy)
                    let degree: Double = (dx == 0) ? 90 : atan(Double(dy/dx)) * 180 / 3.14
                    let posx: CGFloat = (pointPosition[i][0] + pointPosition[j][0])/2
                    let posy: CGFloat = (pointPosition[i][1] + pointPosition[j][1])/2
                    textColor(gameMode: gameMode)
                        .frame(width: distance, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(30)
                        .rotationEffect(.degrees(degree))
                        .offset(x: posx, y: posy)
                }
            }
        }
        .background(backgroundColor(gameMode: gameMode))
        .onTapGesture {
            if detectOn && lineState == correctLineState{
                passLevel = true
            }
        }
    }
}
