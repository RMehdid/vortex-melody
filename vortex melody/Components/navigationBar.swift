//
//  navigationBar.swift
//  vortex melody
//
//  Created by Samy Mehdid on 8/10/2022.
//

import SwiftUI

struct navbar: View {
    @State var color: Color
    @State var company: Company
    
    @Binding var openMenu: Bool
    
    var body: some View {
        HStack{
            Button {
                openMenu = true
            } label: {
                Image(company.companyString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 28)
            }
            .padding()
            .background(Color(UIColor(color).lighter()))
            .frame(width: 64, height: 64)
            .cornerRadius(16)
            .shadow(color: color, radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Image("menu")
                .resizable()
                .frame(width: 42, height: 22)
                .opacity(0.8)
        }
    }
}

struct navbar_Previews: PreviewProvider {
    static var previews: some View {
        navbar(color: .black, company: .Porsche, openMenu: .constant(false))
    }
}
