//
//  Level3Screen.swift
//  Number
//
//  Created by 恩恩 on 2021/8/10.
//

import SwiftUI

let lv3w: CGFloat = screenWidth*11/60

struct Level3Screen: View {

    @Binding var gameMode: GameMode
    @Binding var levelProgress: Int
    @Binding var currentLevel: Int
    @Binding var detectOn: Bool
    @Binding var passLevel: Bool
    
    @State var Voffset: [CGSize] = [.zero,.zero]
    @State var Hoffset: [CGSize] = [.zero,.zero,.zero]

    @State var VstartPosition: [[CGFloat]] = [[-lv3w*2, lv3w],[0,lv3w],[lv3w*2,lv3w],[-lv3w*2,-lv3w],[0,-lv3w],[lv3w*2,-lv3w]]
    @State var HstartPosition: [[CGFloat]] = [[-lv3w, lv3w*2],[lv3w,lv3w*2],[-lv3w,0],[lv3w,0],[-lv3w,-lv3w*2],[lv3w,-lv3w*2]]
    
    @State var VPosition: [[CGFloat]] = [[-lv3w*2,-lv3w],[0,lv3w]]
    @State var HPosition: [[CGFloat]] = [[-lv3w,lv3w*2],[lv3w,lv3w*2],[lv3w,0]]
    
    @State var VpositionIdx: [Int] = [3, 1]
    @State var HpositionIdx: [Int] = [0, 1, 3]
    
    @State var Vstate: [Bool] = [false, true, false, true, false, false]
    @State var Hstate: [Bool] = [true, true, false, true, false, false]
    
    @State var correctVstate1: [Bool] = [false, true, false, false, true, false]
    @State var correctHstate1: [Bool] = [true, false, true, false, true, false]
    
    @State var correctVstate2: [Bool] = [false, false, true, false, false, true]
    @State var correctHstate2: [Bool] = [false, true, false, true, false, true]
    
    private func VgetDragGesture(for idx: Int) -> some Gesture {
        DragGesture()
            .onChanged { value in
                if !detectOn{
                    self.Voffset[idx] = value.translation
                }
            }
            .onEnded { value in
                let dest_idx = VfindNearest(x: VPosition[idx][0] + Voffset[idx].width, y: VPosition[idx][1] + Voffset[idx].height)
                
                
                if dest_idx != -1{
                    let posIdx = VpositionIdx[idx]
                    Vstate[posIdx] = false
                    Vstate[dest_idx] = true
                    VPosition[idx] = VstartPosition[dest_idx]
                    VpositionIdx[idx] = dest_idx
                }
                
                self.Voffset[idx] = .zero
            }
    }
    
    func VfindNearest(x: CGFloat, y: CGFloat) -> Int {
        for i in 0...5 {
            let dis = (VstartPosition[i][0] - x) * (VstartPosition[i][0] - x) + (VstartPosition[i][1] - y) * (VstartPosition[i][1] - y)
            
            if dis < 3000 && !Vstate[i]{
                return i
            }
        }
        
        return -1
    }
    
    private func HgetDragGesture(for idx: Int) -> some Gesture {
        DragGesture()
            .onChanged { value in
                if !detectOn{
                    self.Hoffset[idx] = value.translation
                }
            }
            .onEnded { value in
                let dest_idx = HfindNearest(x: HPosition[idx][0] + Hoffset[idx].width, y: HPosition[idx][1] + Hoffset[idx].height)
                
                
                if dest_idx != -1{
                    let posIdx = HpositionIdx[idx]
                    Hstate[posIdx] = false
                    Hstate[dest_idx] = true
                    HPosition[idx] = HstartPosition[dest_idx]
                    HpositionIdx[idx] = dest_idx
                }
                
                self.Hoffset[idx] = .zero
            }
    }
    
    func HfindNearest(x: CGFloat, y: CGFloat) -> Int {
        for i in 0...5 {
            let dis = (HstartPosition[i][0] - x) * (HstartPosition[i][0] - x) + (HstartPosition[i][1] - y) * (HstartPosition[i][1] - y)
            
            if dis < 3000 && !Hstate[i]{
                return i
            }
        }
        
        return -1
    }
    
    var body: some View {
        
        
        ZStack{
            
            ForEach((0...5), id: \.self) { idx in
                textColor(gameMode: gameMode).opacity(0.2)
                    .frame(width: 10, height: screenWidth/3)
                    .cornerRadius(100)
                    .offset(x: VstartPosition[idx][0], y: VstartPosition[idx][1])
            }
            
            ForEach((0...5), id: \.self) { idx in
                textColor(gameMode: gameMode).opacity(0.2)
                    .frame(width: screenWidth/3, height: 10)
                    .cornerRadius(100)
                    .offset(x: HstartPosition[idx][0], y: HstartPosition[idx][1])
            }
            
            ForEach((0...2), id: \.self) { idx in
                textColor(gameMode: gameMode)
                    .frame(width: screenWidth/3, height: 10)
                    .cornerRadius(100)
                    .offset(x: HPosition[idx][0] + self.Hoffset[idx].width, y: HPosition[idx][1] + self.Hoffset[idx].height)
                    .gesture(HgetDragGesture(for: idx))
            }
            
            ForEach((0...1), id: \.self) { idx in
                textColor(gameMode: gameMode)
                    .frame(width: 10, height: screenWidth/3)
                    .cornerRadius(100)
                    .offset(x: VPosition[idx][0] + self.Voffset[idx].width, y: VPosition[idx][1] + self.Voffset[idx].height)
                    .gesture(VgetDragGesture(for: idx))
            }
        
        }
        .background(backgroundColor(gameMode: gameMode))
        .onTapGesture {
            if detectOn{
                
                if Vstate == correctVstate1 && Hstate == correctHstate1{
                    passLevel = true
                }
                
                if Vstate == correctVstate2 && Hstate == correctHstate2{
                    passLevel = true
                }
                
            }
        }
    }
}
