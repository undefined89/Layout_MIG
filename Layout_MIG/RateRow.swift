//
//  RateRow.swift
//  Layout_MIG
//
//  Created by Meerim Dzhetybaeva on 19/8/22.
//

import Foundation
import SwiftUI

struct CurrencyModel: Identifiable {
    let id = UUID()
    let buyRate: Double
//    let currencySign: String
    let currency: String
    let currencyFullName: String
    let currencyPopUp: String
    let sellRate: Double
}

struct RateList {
    
    static let rateList = [
        
        CurrencyModel(buyRate: 475.0, currency: "USD", currencyFullName: "Доллар США", currencyPopUp: "Доллар США (USD)", sellRate: 479.5),
    
        CurrencyModel(buyRate: 484.5, currency: "EUR", currencyFullName: "Евро", currencyPopUp: "Евро (EUR)", sellRate: 490.5),
    
        CurrencyModel(buyRate: 7.15, currency: "RUB", currencyFullName: "Российский рубль", currencyPopUp: "Российский рубль (RUB)", sellRate: 7.75),
    
        CurrencyModel(buyRate: 5.6, currency: "KGS", currencyFullName: "Киргизский сом", currencyPopUp: "Киргизский сом (KGS)", sellRate: 6.2),
    
        CurrencyModel(buyRate: 575.0, currency: "GBP", currencyFullName: "Фунт стерлингов", currencyPopUp: "Фунт стерлингов (GBP)", sellRate: 615.0),
    
        CurrencyModel(buyRate: 63.0, currency: "CNY", currencyFullName: "Китайский юань", currencyPopUp: "Китайский юань (CNY)", sellRate: 71.0),
    
        CurrencyModel(buyRate: 25700.0, currency: "GOLD", currencyFullName: "Золотые слитки, 1гр.", currencyPopUp: "Золотые слитки, 1гр. (GOLD)", sellRate: 27700.0),
        
        CurrencyModel(buyRate: 475.0, currency: "CHF", currencyFullName: "Швейцарский франк", currencyPopUp: "Швейцарский франк (CHF)", sellRate: 515.0),
        
        CurrencyModel(buyRate: 51.0, currency: "HKD", currencyFullName: "Гонконгский доллар", currencyPopUp: "Гонконгский доллар (HKD)", sellRate: 61.0),
        
        CurrencyModel(buyRate: 150.0, currency: "GEL", currencyFullName: "Грузинский лари", currencyPopUp: "Грузинский лари (GEL)", sellRate: 210.0),
        
        CurrencyModel(buyRate: 111.0, currency: "AED", currencyFullName: "Дирхам ОАЭ", currencyPopUp: "Дирхам ОАЭ (AED)", sellRate: 135.0),
        
        CurrencyModel(buyRate: 3.7, currency: "INR", currencyFullName: "Индийская рупия", currencyPopUp: "Индийская рупия (INR)", sellRate: 5.9),
        
        CurrencyModel(buyRate: 285.0, currency: "CAD", currencyFullName: "Канадский доллар", currencyPopUp: "Канадский доллар (CAD)", sellRate: 385.0),
        
        CurrencyModel(buyRate: 89.0, currency: "MYR", currencyFullName: "Малазийский ринггит", currencyPopUp: "Малазийский ринггит (MYR)", sellRate: 107.0),
        
        CurrencyModel(buyRate: 91.0, currency: "PLN", currencyFullName: "Польский злотый", currencyPopUp: "Польский злотый (PLN)", sellRate: 135.0),
        
        CurrencyModel(buyRate: 12.5, currency: "THB", currencyFullName: "Тайский бат", currencyPopUp: "Тайский бат (THB)", sellRate: 17.5),
        
        CurrencyModel(buyRate: 23.0, currency: "TRY", currencyFullName: "Турецкая лира", currencyPopUp: "Турецкая лира (TRY)", sellRate: 43.0),
        
        CurrencyModel(buyRate: 3.8, currency: "UZS (100:1)", currencyFullName: "100 узбекских сумов", currencyPopUp: "100 узбекских сумов (UZS)", sellRate: 5.0),
        
        CurrencyModel(buyRate: 1.0, currency: "UAH", currencyFullName: "Украинская гривна", currencyPopUp: "Украинская гривна (UAH)", sellRate: 13.0),
        
        CurrencyModel(buyRate: 16.3, currency: "CZK", currencyFullName: "Чешская крона", currencyPopUp: "Чешская крона (CZK)", sellRate: 20.3),
        
        CurrencyModel(buyRate: 34.5, currency: "KRW (100:1)", currencyFullName: "100 южнокорейских вон", currencyPopUp: "100 южнокорейских вон (KRW)", sellRate: 42.5),
        
        CurrencyModel(buyRate: 2.7, currency: "JPY", currencyFullName:  "Японская иена", currencyPopUp: "Японская иена (JPY)", sellRate: 3.9),
        
        CurrencyModel(buyRate: 120.0, currency: "ILS", currencyFullName: "Израильский шекель", currencyPopUp: "Израильский шекель (ILS)", sellRate: 170.0)
        
    ]
}

struct RateRow: View {

    @State private var showingSheet1 = false
    @State private var showingSheet2 = false
    @State private var showingSheet3 = false
    
    @State private var showPopUp = false
    
    let currency: CurrencyModel
    
    var body: some View {
            HStack {
                Button(action: {
                    self.showingSheet1.toggle()
                }) {
                    Text("\(currency.buyRate, specifier: "%.1f")")
                        .bold()
                        .foregroundColor(.blue)
                        .frame(width: 75, height: 47, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                } .buttonStyle(.borderless)        
                    .sheet(isPresented: $showingSheet1) {
                        PopView(currency: currency, isSell: false)
                    }
                
                Spacer()
                
                Button(action: {
                    self.showingSheet2.toggle()
                }) {
                    if "\(currency.currency)" == "GOLD" {
                        Text("\(currency.currency)")
                            .fontWeight(.heavy)
                            .foregroundColor(.yellow)
                            .padding(.vertical, 8)
                    } else {
                        Text("\(currency.currency)")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                } .buttonStyle(.borderless)
                    .actionSheet(isPresented: $showingSheet2) {
                        ActionSheet(title: Text("\(currency.currencyFullName)"), buttons: [.cancel(Text("Отмена"))])
                }
                
                Spacer()
                Button(action: {
                    self.showingSheet3.toggle()
                }) {
                    Text("\(currency.sellRate, specifier: "%.1f")")
                        .bold()
                        .foregroundColor(.blue)
                        .frame(width: 75, height: 47, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                } .buttonStyle(.borderless)
                    .sheet(isPresented: $showingSheet3) {
                        PopView(currency: currency, isSell: true)
                    }

        } .background(Color.blue)
    }
}
