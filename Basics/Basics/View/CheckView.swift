//
//  CheckView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/5/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI



struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        TitleCheckBox()
    }
}

struct TitleCheckBox: View {
    @State private var isChecked:Bool = true
    var name:String
    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            Text(name)
                .foregroundColor(Color.green)
                .padding(.leading, 24)
            Spacer()
            CheckBox(isChecked: $isChecked)
                .padding(.trailing, 24)
            Spacer()
        }
    }
}

struct CheckBox: View {
    @Binding var isChecked:Bool
    var body: some View {
        Button(action: {
            self.isChecked.toggle()
        }) {
            if isChecked {
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

