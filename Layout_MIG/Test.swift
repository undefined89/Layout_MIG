////
////  ContentView.swift
////  Layout_MIG
////
////  Created by Meerim Dzhetybaeva on 18/8/22.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var pickers = ["Курсы валют", "Ближайшие пункты"]
//    
//    @State private var selectedPicker = 0
//    
//    @State var showSideMenu = false
//    
//    @State var showShareMenu = false
//    
//    var body: some View {
//        
//        ZStack {
//            VStack {
//                HStack {
//                    Button(action: {
//                        self.showSideMenu.toggle()
//                    }) {
//                        Image(systemName: "line.horizontal.3")
//                    }
//                    
////                    .sheet(isPresented: $showSideMenu, content: {
////                        SideMenu()
////                    })
//                    
//                        .foregroundColor(.blue)
//                    Spacer()
//                    Text("Главная")
//                        .bold()
//                        .foregroundColor(.blue)
//                    Spacer()
//                    Button(action: {
//                        self.showShareMenu.toggle()
//                    }) {
//                        Image(systemName: "square.and.arrow.up")
//                    }
//                    
////                    .sheet(isPresented: $showSideMenu, content: {
////                        SideMenu()
////                    })
//                    .foregroundColor(.blue)
//                } .padding(.vertical, 5)
//                
//                ZStack {
//                    HStack {
//                        Picker(selection: $selectedPicker, label: EmptyView()) {
//                            ForEach(0..<pickers.count) {
//                                Text(self.pickers[$0])
//                                    .tag([$0])
//                            }
//                        } .pickerStyle(SegmentedPickerStyle())
//                    }
//                } .padding(.vertical, 5)
//                
//                if selectedPicker == 0 {
//                    CurrencyView()
//                    FooterView()
//                } else {
//                    NearestSpots()
//                        .animation(.spring(response: 0.001, dampingFraction: 1.0, blendDuration: 0.5))
//                        .transition(.move(edge: .trailing))
//                        .padding()
//                        .frame(width: .infinity, height: .infinity)
//                }
//                
//            } .frame(maxWidth: .infinity)
//                .padding(20)
//                .background(Color.white)
//            
//            SideMenu(showSideMenu: $showSideMenu)
//                .offset(x: showSideMenu ? -50 : -400)
//                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//            
//            SideMenu(showSideMenu: $showShareMenu)
//                .offset(y: showShareMenu ? 0 : 900)
//                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
