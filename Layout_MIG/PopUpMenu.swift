//
//  PopUpMenu.swift
//  Layout_MIG
//
//  Created by Meerim Dzhetybaeva on 19/8/22.
//

import SwiftUI

struct PopView: View {
    
    @State var currency: CurrencyModel
    @State var isSell: Bool
    
    private let currencySign: String = "$"
    private let tengeCurrencySign: String = "₸"
    
    @State var checkAmount = ""

    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("\(currency.currencyPopUp)")
                .padding(5)
                .font(.system(size: 22, weight: .heavy, design: .default))

            Text("По курсу")
                .padding(5)
                .foregroundColor(.gray)
            
            Text("\(isSell ? 1 * currency.sellRate : 1 * currency.buyRate, specifier: "%.1f")")
                .padding(5)
                .font(.system(size: 22, weight: .heavy, design: .default))
                .foregroundColor(.blue)
            
            HStack {
                Text(isSell ? "Купить" : "Продать")
                    .padding(7)
                Spacer()
                Text(isSell ? "Требуется" : "Получить")
                    .padding(7)
            }
            HStack {
                
                TextField("\(1)", text: $checkAmount)
                    .padding(.leading, 7)
                    .frame(width: 100, height: 50, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.blue)
                    .font(.system(size: 20, weight: .medium, design: .default))
                Text("\(currencySign)")
                    .bold()
                   
                Spacer()
//                Text("\((Double(checkAmount) ?? 1)! * RateList.rateList[0].buyRate, specifier: "%.0f")")
//                    .padding(7)
//                    .frame(width: 100, height: 50, alignment: .center)
//                    .border(.ultraThinMaterial, width: 1)
//                    .foregroundColor(.blue)
//                    .font(.system(size: 20, weight: .medium, design: .default))
                
                TextField("\(isSell ? 1 * currency.sellRate : 1 * currency.buyRate, specifier: "%.0f")", text: $checkAmount)
                    .padding(.leading, 7)
                    .frame(width: 100, height: 50, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.blue)
                    .font(.system(size: 20, weight: .medium, design: .default))
                
                Text("\(tengeCurrencySign)")
                    .bold()
                    .padding(.trailing, 7)
            }
        }
    }
}

//struct PopUpMenu: View {
//    
//    var body: some View {
//        PopView()
//    }
//}

//struct PopUpMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        PopView(cur
//    }
//}
