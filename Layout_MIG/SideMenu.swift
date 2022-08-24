//
//  SideMenu.swift
//  Layout_MIG
//
//  Created by Meerim Dzhetybaeva on 19/8/22.
//

import SwiftUI

struct MenuRow: View {
    var systemIcon: String
    var description: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "drop")
                    .resizable()
                    .frame(width: 20, height: 20)
                if "\(description)" == "Забронировать   сумму/курс" {
                    Text("\(description)")
                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                        .foregroundColor(.blue)
                } else {
                    Text("\(description)")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(.blue)
                }
            }
        } .frame(width: .infinity, height: .infinity, alignment: .leading)
    }
}

struct SideMenu: View {
    
    @Binding var showSideMenu: Bool
    
//    @Binding var showShareMenu: Bool
    
    @State private var icons = ["heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart", "heart"]
    
    @State private var descriptions = ["Главная", "Забронировать сумму/курс", "Золотые слитки НБ КР", "Ближайшие пункты", "Финансовые новости и аналитика", "Архив курсов", "Курсы НацБанка РК", "Вход/Регистрация", "О компании", "Как нас найти?", "Информация для клиентов", "Получить скидку", "Уведомления", "Отзывы и предложения", "Вакансии", "Поделиться"]
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Image("МиГ")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .padding(.leading, 20)
                    Text("МиГ")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .foregroundColor(.blue)
                }
                Divider()
                VStack(alignment: .leading) {
                    List {
                        ForEach(0..<8) {
                            MenuRow(systemIcon: "\(icons[$0])", description: "\(descriptions[$0])")
                        } .listRowSeparator(.hidden)
                            .listRowInsets(.none)
                        Divider()
                        ForEach(8..<icons.count) {
                            MenuRow(systemIcon: "\(icons[$0])", description: "\(descriptions[$0])")
                        } .listRowSeparator(.hidden)
                            .listRowInsets(.none)
                    } .listStyle(PlainListStyle())
                    
                }
            }
        } .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(.white)
    }
}

//struct SideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenu()
//    }
//}
