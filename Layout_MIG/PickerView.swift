//
//  PickerView.swift
//  Layout_MIG
//
//  Created by Meerim Dzhetybaeva on 23/8/22.
//

import SwiftUI

struct PickerView: View {
    
    @State var selectedPicker = 1
    var pickers: [String] = []
    
    var body: some View {

        Picker(selection: $selectedPicker, label: EmptyView()) {
            ForEach(0..<pickers.count) { index in
                Text(self.pickers[index])
                    .tag([index])
            }
        } .pickerStyle(SegmentedPickerStyle())
    }
}

struct PickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        PickerView()
    }
}
