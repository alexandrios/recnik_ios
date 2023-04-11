//
//  HistoryView.swift
//  recnik_ios
//
//  Created by Alexander Plotnikov on 11.04.2023.
//

import SwiftUI

struct HistoryView: View {
    
    let colorPrimary: UIColor = #colorLiteral(red: 0.9960784314, green: 0.2235294118, blue: 0.1176470588, alpha: 1)
    let mainBackcolor: UIColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
    let setGroupTitelColor = #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
    let separatorColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    let colorPrimaryDark: UIColor = #colorLiteral(red: 0.5529411765, green: 0.5568627451, blue: 0.6549019608, alpha: 1)
    let mainBackcolorDark: UIColor = #colorLiteral(red: 0.1294117647, green: 0.1411764706, blue: 0.2078431373, alpha: 1)
    let setGroupTitelColorDark = #colorLiteral(red: 0.5529411765, green: 0.5568627451, blue: 0.6549019608, alpha: 1)
    
    @State var currentTheme: Bool = true
    
    let columns: [GridItem] = [ GridItem( .flexible(), spacing: nil, alignment: nil) ]
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top, spacing: nil, content: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 28, height: 28, alignment: .center)
                        .foregroundColor(Color(colorPrimary))
                    
                    Spacer()
                    
                    Image(systemName: "trash.fill")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 28, height: 28, alignment: .center)
                        .foregroundColor(Color(colorPrimary))
                })
                .padding()
                .background(
                    Text("История")
                        .foregroundColor(Color(colorPrimary))
                        .font(.title)
                        //.bold()
                )
                
                SeparateLine(size: 0.5, paddingBottom: 0)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 28, height: 28, alignment: .center)
                    .foregroundColor(Color(separatorColor))
                    .padding(Edge.Set.trailing, 20)

                    TextField("Поиск", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .font(.title)
                }
                .frame(height: 57)
                //.padding(Edge.Set.top, 0)
                .padding(Edge.Set.leading, 24)
                .padding(Edge.Set.trailing, 24)
                
                
                VStack(alignment: .leading, spacing: 30) {
                    ScrollView() {
                        LazyVGrid(columns: columns,
                                  alignment: .center,
                                  spacing: 0,
                                  pinnedViews: [],
                                  content: {
                            ForEach(0..<50) { index in
                                Rectangle()
                                    .fill(Color(mainBackcolor))
                                    .frame (height: 57)
                                    
                                SeparateLine(size: 0.5, paddingBottom: 0)
                            }
                        })
                    }
                }
                //.padding(Edge.Set.leading, 24)
                //.padding(Edge.Set.trailing, 24)
            }
        }
        .background(Color(currentTheme ? mainBackcolor : mainBackcolorDark))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
