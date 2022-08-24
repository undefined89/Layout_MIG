//
//  FooterView.swift
//  Layout_MIG
//
//  Created by Meerim Dzhetybaeva on 23/8/22.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack {
            Button(action: {
                //
            }) {
                Text("Забронировать сумму/курс")
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.vertical, 5)
            }
            
            Text("Лицензия АГФ НБ РК №7520029 от 23.09.2020")
                .font(.system(size: 12, weight: .light, design: .default))
                .foregroundColor(.blue)
        }
        
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
