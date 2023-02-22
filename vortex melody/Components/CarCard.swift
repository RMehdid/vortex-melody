//
//  CarCard.swift
//  vortex melody
//
//  Created by Samy Mehdid on 11/10/2022.
//

import SwiftUI

struct carCard: View {
    @State var car: Car
    
    var action: (() -> Void)?
    
    var background: Color {
        return UIImage(named: car.model)?.averageColor ?? .gray
    }
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Text(car.model)
                        .font(.custom("Rubik-SemiBold", size: 48))
                        .foregroundColor(.white.opacity(0.4))
                    Spacer()
                }
                Spacer()
            }
            HStack{
                Spacer()
                Image(car.model)
                    .resizable()
                    .frame(width: 300, height: 180)
            }
            .padding(.top, 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        self.action!()
                    } label: {
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .frame(width: 34, height: 28)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(UIColor(background).lighter()))
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(UIColor(background).lighter().lighter()), lineWidth: 4)
                            )
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(background).lighter()), background]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
    }
    
    func showCar(_ action: @escaping () -> Void) -> Self {
        var this = self
        this.action = action
        return this
    }
}


struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        carCard(car: .M5)
    }
}
