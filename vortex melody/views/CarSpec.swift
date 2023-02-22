//
//  CarSpec.swift
//  vortex melody
//
//  Created by Samy Mehdid on 9/10/2022.
//

import SwiftUI

struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}

extension View {
    func fontWithLineHeight(font: UIFont, lineHeight: CGFloat) -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: font, lineHeight: lineHeight))
    }
}

struct CarSpecView: View {
    @State var car: Car
    
    @State var enterCar = false
    
    @State var openMenu = false
    
    @State var selectedCategory: Category?
    
    @State var selectedSubCategory: SubCategory = .all
    
    @Environment(\.presentationMode) private var presentationMode
    @GestureState private var dragOffset = CGSize.zero
    
    var background: Color {
        return UIImage(named: car.model)?.averageColor ?? .gray
    }
    
    var body: some View {
        ZStack{
            NavigationLink(destination: InCarView(car: car), isActive: $enterCar){}
            
            ZStack {
                if selectedCategory == nil {
                    VStack(spacing: 40){
                        ZStack{
                            VStack(alignment: .leading, spacing: 12){
                                Text(car.model)
                                    .opacity(0.5)
                                    .font(.custom("Rubik-Bold", size: 48))
                                HStack(alignment: .top, spacing: 0){
                                    Text(String(car.maxSpeed))
                                        .foregroundColor(.white)
                                        .fontWithLineHeight(font: UIFont(name: "Rubik-Regular", size: 158)!, lineHeight: 118)
                                    
                                    Text("Km")
                                        .font(.custom("Rubik-Medium", size: 24))
                                }
                                Text("max")
                                    .opacity(0.5)
                                    .font(.custom("Rubik-Medium", size: 32))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .fixedSize(horizontal: true, vertical: false)
                            .foregroundColor(.white)
                            
                            VStack{
                                Spacer()
                                Image(car.model)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 350, height: 280, alignment: .leading)
                                    .padding(.trailing, 32)
                                    .clipped()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 600, alignment: .trailing)
                        }
                        HStack(spacing: 40){
                            VStack {
                                Text("100Km")
                                    .font(.custom("Rubik-SemiBold", size: 24))
                                    .opacity(0.5)
                                if car.engineLiters != nil {
                                    Text(String(format: "%.1fl", car.engineLiters!))
                                        .font(.custom("Rubik-Regular", size: 38))
                                } else {
                                    Text(car.engineCunsum.ConsumString)
                                        .font(.custom("Rubik-Regular", size: 38))
                                }
                            }
                            Divider()
                                .frame(width: 3, height: 70)
                                .overlay(Color(UIColor(background).lighter().lighter()))
                            VStack {
                                Text("0 - 100 Km/h")
                                    .font(.custom("Rubik-SemiBold", size: 20))
                                    .opacity(0.5)
                                Text(String(format: "%.1fs", car.acceleration))
                                    .font(.custom("Rubik-Regular", size: 38))
                            }
                        }
                        .foregroundColor(.white)
                        Spacer()
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        EnterCarSlider(ThumbColor: Color(UIColor(background).lighter().lighter()), trackColor: background)
                            .onSwipeSuccess {
                                enterCar = true
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 28)
                                    .stroke(Color(UIColor(background).lighter().lighter()), lineWidth: 4)
                            )
                            .shadow(color: Color(UIColor(background).lighter().lighter()).opacity(0.5), radius: 20, x: 0, y: 0)
                    }
                }
            }
            .overlay(
                Rectangle()
                    .fill(Color.black.opacity(openMenu ? 0.6 : 0))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        openMenu = false
                    }
            )
            VStack(spacing: 20){
                if openMenu{
                    ManifacturerMenu(car: car, openMenu: $openMenu, selectedCategory: $selectedCategory)
                } else {
                    navbar(color: background, company: car.company, openMenu: $openMenu)
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(background).lighter()), background]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all))
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            if value.startLocation.x < 40 && value.translation.width > 80 {
                presentationMode.wrappedValue.dismiss()
            }
        }))
    }
}

struct CarSpecView_Previews: PreviewProvider {
    static var previews: some View {
        CarSpecView(car: .M5, selectedCategory: .Sedan, selectedSubCategory: .series)
    }
}
