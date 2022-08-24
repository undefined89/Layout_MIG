//
//  CurrencyView.swift
//  Layout_MIG
//
//  Created by Meerim Dzhetybaeva on 23/8/22.
//

import SwiftUI

struct CurrencyView: View {
    
    @State var showingWholePage = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Spacer()
                    VStack {
                        Text("КУРСЫ")
                            .font(.system(size: 17, weight: .heavy, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                        VStack {
                            Text("ЗОЛОТЫЕ")
                                .font(.system(size: 13, weight: .heavy, design: .default))
                                .foregroundColor(.yellow)
                            Text("СЛИТКИ")
                                .font(.system(size: 13, weight: .heavy, design: .default))
                                .foregroundColor(.yellow)
                        }
                    } .padding(.top, 15)
                    Spacer()
                    VStack {
                        Image("МиГ")
                            .clipShape(Circle())
                        .padding(.top, 15)
                    }
                    VStack {
                        Text("ВАЛЮТ")
                            .font(.system(size: 17, weight: .heavy, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                        VStack {
                            Text("Национального")
                                .font(.system(size: 12, weight: .heavy, design: .default))
                                .foregroundColor(.yellow)
                            Text("банка РК")
                                .font(.system(size: 12, weight: .heavy, design: .default))
                                .foregroundColor(.yellow)
                        }
                    } .padding(.top, 15)
                    Spacer()
                }
                Text("На 18 августа 2022 18:10")
                    .font(.system(size: 14, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                
                if showingWholePage == false {
                    List {
                        ForEach(0..<7) { index in
                            RateRow(currency: RateList.rateList[index])
                        } .listRowBackground(Color.blue)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.none)
                    } .listStyle(PlainListStyle())
                } else {
                    List {
                        ForEach(0..<RateList.rateList.count) { index in
                            RateRow(currency: RateList.rateList[index])
                            //, actionSheet2: "\(self.actionSheet2[$0])")
                        }  .listRowBackground(Color.blue)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.none)
                    } .listStyle(PlainListStyle())
                }
                
                VStack(alignment: .center) {
                        Button(action: {
                            self.showingWholePage = true
                        }) {
                            Text("Дополнительные валюты")
                        } .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.white)
                            .background(Color.blue)
                            .padding(.bottom, 5)
                    }
                    VStack(alignment: .center) {
                        Button(action: {
                            self.showingWholePage = true
                        }) {
                            Image(systemName: "arrow.down.app")
                        } .foregroundColor(.white)
                            .background(Color.blue)
                    }
            }
        } .background(Color.blue)
            .cornerRadius(15)
    }
}


struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
