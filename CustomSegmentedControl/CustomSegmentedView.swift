//
//  CustomSegmentedView.swift
//  CustomSegmentedControl
//
//  Created by Christopher Elbert on 2/6/24.
//

import SwiftUI

struct CustomSegmentedView: View {
    let segments: [String] = ["OPEN", "COMPLETED", "CANCELLED", "ALL"]
    @State private var selected: String = "OPEN"
    @Namespace var name
    
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments, id:\.self) { segment in
                let isSegmentSelected = segment == selected
                Button {
                    selected = segment
                } label: {
                    ZStack {
                        Text(segment)
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(
                                isSegmentSelected ?
                                    .green : .gray
                            )
                        ZStack {
                            Capsule()
                                .fill(.clear)
                                .frame(height: 30)
                            if isSegmentSelected {
                                Capsule()
                                    .fill(.green)
                                    .frame(height: 30)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                                    .opacity(0.3)
                            }
                        }
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    CustomSegmentedView()
}
