//
//  EnterCarSlider.swift
//  vortex melody
//
//  Created by Samy Mehdid on 8/10/2022.
//

import SwiftUI

extension EnterCarSlider {
    func onSwipeSuccess(_ action: @escaping () -> Void) -> Self {
        var this = self
        this.actionSuccess = action
        return this
    }
}

struct EnterCarSlider: View {
    @State var ThumbColor: Color
    @State var trackColor: Color
    
    @State private var thumbSize: CGSize = .thumbSize
    @State private var dragOffset: CGSize = .zero
    @State private var isEnough = false
    var actionSuccess: (() -> Void)?
    let trackSize: CGSize = .trackSize
    var body: some View{
        ZStack{
            ZStack{
                Image("wheel")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .frame(width: thumbSize.width, height: thumbSize.height)
            .background(ThumbColor)
            .cornerRadius(28)
            .offset(x: getDragOffsetX, y: 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: true)
            .gesture(DragGesture()
                .onChanged({ value in self.handleDragChanged(value)})
                .onEnded({ _ in self.handleDragEnded()})
            )
        }
        .frame(width: trackSize.width + 20, height: trackSize.height)
        .background(trackColor.shimmering())
        .cornerRadius(28)
    }
    
    //MARK: - Helpers
    private var getDragOffsetX: CGFloat {
        let clampedDragOffsetX = dragOffset.width.clamp(lower: 0, trackSize.width - thumbSize.width)
        return -(trackSize.width / 2 - thumbSize.width / 2 - (clampedDragOffsetX))
    }
    
    //MARK: - Gesture Handlers
    private func handleDragChanged(_ value: DragGesture.Value) -> Void {
        self.dragOffset = value.translation
        
        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width*2)
        let didReachTarget = dragWidth > targetDragWidth
        
        if didReachTarget {
            self.isEnough = true
        } else {
            self.isEnough = false
        }
    }
    
    private func handleDragEnded() -> Void {
        if isEnough {
            self.dragOffset = CGSize(width: self.trackSize.width - self.thumbSize.width, height: 0)
            if nil != self.actionSuccess {
                self.actionSuccess!()
            }
            self.dragOffset = .zero
        } else {
            self.dragOffset = .zero
        }
    }
}

struct EnterCarSlider_Previews: PreviewProvider {
    static var previews: some View {
        EnterCarSlider(ThumbColor: .cyan, trackColor: .blue)
    }
}
