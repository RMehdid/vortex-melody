//
//  ManifacturerMenu.swift
//  vortex melody
//
//  Created by Samy Mehdid on 10/10/2022.
//

import SwiftUI

struct ManifacturerMenu: View {
    @State var car: Car
    
    @Binding var openMenu: Bool
    
    @Binding var selectedCategory: Category?
    
    @Environment(\.presentationMode) var presentationMode
    
    var background: Color {
        return UIImage(named: car.model)?.averageColor ?? .gray
    }
    
    var lighterBackground: Color {
        return Color(UIColor(background).lighter().lighter())
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 16){
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 12){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 28)
                            Image(car.company.companyString)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 38)
                            Text(car.company.companyString)
                                .font(.custom("Rubik-Medium", size: 28))
                        }
                    }
                    Spacer()
                    Button {
                        openMenu = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                }
                .padding(.horizontal, 32)
                Divider()
                    .frame(height: 2)
                    .overlay(Color.white)
                    .padding(.horizontal)
                VStack{
                    ForEach(car.company.categories, id: \.self){ category in
                        Button {
                            selectedCategory = category
                            openMenu = false
                        } label: {
                            HStack{
                                Text(category.CategoryString)
                                    .font(.custom("Rubik-Medium", size: 24))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 28)
                            }
                        }
                    }
                }
                .padding(.horizontal, 32)
            }
            .padding()
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(lighterBackground)
            .cornerRadius(16)
            .shadow(color: lighterBackground.opacity(0.5), radius: 5, x: 0, y: 0)
        }
    }
}

struct ManifacturerMenu_Previews: PreviewProvider {
    static var previews: some View {
        ManifacturerMenu(car: .macan, openMenu: .constant(true), selectedCategory: .constant(nil))
    }
}
