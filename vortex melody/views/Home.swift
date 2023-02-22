//
//  Home.swift
//  vortex melody
//
//  Created by Samy Mehdid on 8/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var showCar = false
    
    @State var selectedCar: Car = .carrera
    
    var body: some View {
        ZStack {
            NavigationLink(destination: CarSpecView(car: selectedCar), isActive: $showCar) { EmptyView() }
            VStack(alignment: .leading){
                HStack(spacing: 12){
                    Image("Vortex Melody")
                        .resizable()
                        .frame(width: 44, height: 30)
                    Text("Vortex Melody")
                        .font(.custom("Rubik-SemiBold", size: 32))
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 18, height: 22)
                }
                .foregroundColor(.white)
                ScrollView(showsIndicators: false){
                    LazyVStack(spacing: 16){
                        ForEach(Car.cars, id: \.id) { car in
                            carCard(car: car)
                                .showCar {
                                    showCar = true
                                    selectedCar = car
                                }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.08, green: 0.04, blue: 0.38), Color(red: 0.04, green: 0.01, blue: 0.22), Color(red: 0.02, green: 0, blue: 0.15)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
