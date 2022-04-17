//
//  Level11Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/13.
//

import SwiftUI

let w11 = screenWidth/16

struct Level11Screen: View {
    
    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var offset: CGSize = .zero
    @State var score: Int = 0
    @State var timer: Timer?
    
    // 13 x 15
    @State var state: [[Bool]] = [
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]]

    @State var lose: Bool = false
    @State var win: Bool = false
    @State var path: [[Int]] = [[10,4],[10,3],[10,2]]
    @State var eaten: Bool = false
    @State var point: [Int] = [3,12]
    // 0:up, 1:down, 2:left, 3:right
    @State var orient: Int = 3
    
    func action(orient: Int) -> Void {
        
        var nx: Int
        var ny: Int
        
        switch orient {
        case 0:
            nx = path[0][0] - 1
            ny = path[0][1]
            break
        case 1:
            nx = path[0][0] + 1
            ny = path[0][1]
            break
        case 2:
            nx = path[0][0]
            ny = path[0][1] - 1
            break
        case 3:
            nx = path[0][0]
            ny = path[0][1] + 1
            break
        default:
            nx = 0
            ny = 0
            break
        }
        
        if nx < 0 || nx > 12 || ny < 0 || ny > 14 || ([nx,ny] != point && state[nx][ny]){
            lose = true
        }else{
            let index = path.firstIndex(of: [nx,ny])
            if index != nil{
                path.remove(at: index!)
            }
            path.insert([nx,ny], at: 0)
            if [nx,ny] == point{
                score += 1
                eaten = true
                if score == 11{
                    win = true
                }
            }
        }
        
    }
    
    private func getDragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                if !detectOn{
                    self.offset = value.translation
                }
            }
            .onEnded { value in
                if !detectOn{
                    let x = self.offset.width
                    let y = self.offset.height
                    
                    if abs(x) > abs(y){
                        if x > 0{
                            orient = 3
                        }else{
                            orient = 2
                        }
                    }else{
                        if y > 0{
                            orient = 1
                        }else{
                            orient = 0
                        }
                    }
                }
        }
    }
    
    var body: some View {
        VStack{
            Text("\(score)")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(textColor(gameMode: gameMode))
                .onTapGesture {
                    if detectOn && score == 11{
                        passLevel = true
                    }
                }
            
            ZStack{

                backgroundColor(gameMode: gameMode)
                    .frame(width: screenWidth*7/8+15, height: screenWidth*6/8+15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        ZStack{
                            Rectangle()
                                .padding(-10)
                                .foregroundColor(textColor(gameMode: gameMode))
                                //.cornerRadius(10)
                            Rectangle()
                                .padding(-6)
                                .foregroundColor(backgroundColor(gameMode: gameMode))
                        }
                    )
                
                ForEach((0...12), id: \.self) { i in
                    ForEach((0...14), id: \.self) { j in
                        Rectangle()
                            .foregroundColor(state[i][j] ? textColor(gameMode: gameMode) : Color.white.opacity(0))
                            .frame(width: w11-5, height: w11-5)
                            .offset(x: CGFloat(j-7)*w11, y: CGFloat(i-6)*w11)
                    }
                }
                
                if lose{
                        
                    ZStack{
                        textColor(gameMode: gameMode).opacity(0.7)
                            .frame(width: screenWidth*7/8+30, height: screenWidth*6/8+30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        VStack{
                            Text("You lose.")
                                .font(.system(size: 50, weight: .bold, design: .rounded))
                                .foregroundColor(backgroundColor(gameMode: gameMode))
                                .padding()
                            Text("Tap to restart")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(backgroundColor(gameMode: gameMode))
                        }
                    }
                    .onTapGesture {
                        lose = false
                        eaten = false
                        score = 0
                        path = [[10,4],[10,3],[10,2]]
                        point = [3,12]
                        orient = 3
                    }
                }
                
                if win{
                    ZStack{
                        textColor(gameMode: gameMode).opacity(0.7)
                            .frame(width: screenWidth*7/8+30, height: screenWidth*6/8+30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("You Win!")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(backgroundColor(gameMode: gameMode))
                            .padding()
                    }
                }
                
            }
                
        }
        .gesture(getDragGesture())
        .onAppear {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                
                if lose || win{
                    return
                }
                
                for i in 0...12{
                    for j in 0...14{
                        state[i][j] = false
                    }
                }
                
                for idx in 0...score+2{
                    state[path[idx][0]][path[idx][1]] = true
                }
                
                if eaten{
                    point[0] = Int.random(in: 1...11)
                    point[1] = Int.random(in: 1...13)
                    while(state[point[0]][point[1]]){
                        point[0] = Int.random(in: 1...11)
                        point[1] = Int.random(in: 1...13)
                    }
                    eaten = false
                }else{
                    state[point[0]][point[1]] = true
                }
                
                action(orient: orient)
            }
        }
    }
}
