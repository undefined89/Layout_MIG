//
//  ContentView.swift
//  Layout_MIG
//
//  Created by Meerim Dzhetybaeva on 18/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pickers = ["Курсы валют", "Ближайшие пункты"]
    
    @State private var selectedPicker = 0
    
    @State var showSideMenu = false
    
    @State var showShareMenu = false
    
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack(spacing: 0) {
                    Picker(selection: $selectedPicker, label: EmptyView()) {
                        ForEach(0..<pickers.count) {
                            Text(self.pickers[$0])
                                .tag([$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom, 13)
                    
                    if selectedPicker == 0 {
                        CurrencyView()
                        FooterView()
                    } else {
                        NearestSpots()
                            .animation(.spring(response: 0.001, dampingFraction: 1.0, blendDuration: 0.5))
                            .transition(.move(edge: .trailing))
                            .padding()
                            .frame(width: .infinity, height: .infinity)
                    }
                    
                } .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Button {
                                    self.showSideMenu.toggle()
                                                  
//                                    (avc, animated: true, completion: nil)
                                    
                                } label: {
                                    Image(systemName: "line.horizontal.3")
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .padding(.leading, 5)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Button {
                                    self.showShareMenu.toggle()
                                } label: {
                                    Image(systemName: "square.and.arrow.up")
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .padding(.trailing, 5)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Главная")
                                    .padding()
                                    .foregroundColor(.blue)
                                    .font(Font.body.bold())
                            }
                        }
                    } .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(20)
                    .background(Color.white)
        }

            SideMenu(showSideMenu: $showSideMenu)
                .offset(x: showSideMenu ? -30 : -400)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            SideMenu(showSideMenu: $showShareMenu)
                .offset(y: showShareMenu ? 0 : 900)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
