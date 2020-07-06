//
//  CheckView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/5/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

class FilterState: ObservableObject {
    @Published var editable:[Filter]
    
    init() {
        editable =  [Filter(false,"iOS & Android"),
                          Filter(false,"Swift"),
                          Filter(false, "Server Side"),
                          Filter(false, "Unity")]
    }
    
    func update(_ filter: Filter, _ value:Bool) {
        print("Filter Reveived: \(filter.name)  ---> value: \(value)")
        let index = self.editable.firstIndex(of: filter)
        editable[index!].isChecked = value
        print(editable)
    }
}

struct Filter: Identifiable, Hashable {
    var id = UUID()
    var isChecked:Bool
    var name:String
    
    init(_ isChecked: Bool, _ name: String) {
        self.isChecked = isChecked
        self.name = name
    }
}


// Will be used later
struct FilterList: View {
    var filterState = FilterState()
    var body: some View {
        VStack(spacing: 10) {
            ForEach(filterState.editable, id: \.self) { filter in
                TitleCheckBox(filter: filter) { isChecked in
                    print("Filter Name: \(filter.name) ---> \(isChecked)")
                }
            }
        }
    }
}


struct TitleCheckBox: View {
    @State var filter:Filter
    var onChange: (Bool) -> Void
    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            Text(filter.name)
                .foregroundColor(Color.green)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            CheckBox(filter: $filter, onChange: onChange)
                .padding(.trailing, 24)
        }
    }
}

struct CheckBox: View {
    @Binding var filter:Filter
    var onChange: (Bool) -> Void
    var body: some View {
        Button(action: {
            self.filter.isChecked.toggle()
            // here data is being passed from child to parent view.
            self.onChange(self.filter.isChecked)
        }) {
            if filter.isChecked {
                 OnView()
            } else {
                OffView()
            }
        }
    }
}

struct OnView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.white)
            .frame(width: 40, height: 40)
        .overlay(Image(systemName: "checkmark.square.fill")
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(Color.green))
    }
}

struct OffView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.gray)
            .frame(width: 40, height: 40)
        .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .frame(width: 36, height: 36)
            )
    }
}



struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        FilterList()
    }
}
