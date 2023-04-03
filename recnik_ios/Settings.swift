//
//  Settings.swift
//  recnik_ios
//
//  Created by Alexander Plotnikov on 02.04.2023.
//

import SwiftUI

struct Settings: View {
    
    let colorPrimary: UIColor = #colorLiteral(red: 0.9960784314, green: 0.2235294118, blue: 0.1176470588, alpha: 1)
    let mainBackcolor: UIColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
    let setGroupTitelColor = #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
    let separatorColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    let colorPrimaryDark: UIColor = #colorLiteral(red: 0.5529411765, green: 0.5568627451, blue: 0.6549019608, alpha: 1)
    let mainBackcolorDark: UIColor = #colorLiteral(red: 0.1294117647, green: 0.1411764706, blue: 0.2078431373, alpha: 1)
    let setGroupTitelColorDark = #colorLiteral(red: 0.5529411765, green: 0.5568627451, blue: 0.6549019608, alpha: 1)
    
    
    let themeLight = #imageLiteral(resourceName: "theme_light")
    let themeDark = #imageLiteral(resourceName: "theme_dark")
    
    @State var settings_srb_alphabet = "Кириллица"
    @State var settings_srb_stress = "Знак"
    @State var settings_rus_stress = "Цвет"
    
    @State var currentTheme: Bool = true
    

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
                })
                .padding()
                .background(
                    Text("Настройки")
                        .foregroundColor(Color(colorPrimary))
                        .font(.title)
                        .bold()
                )
                
                SeparateLine(size: 0.5)
                
                VStack(alignment: .leading, spacing: 30) {
                    ScrollView() {
                        Group {
                            HStack {
                                Text("Настройки словаря".uppercased())
                                    .foregroundColor(Color(setGroupTitelColor))
                                Spacer()
                            }
                            .padding(Edge.Set.leading, 24)
                            .padding(Edge.Set.trailing, 24)
                            
                            SeparateLine(size: 0.5)
                            
                            HStack(spacing: nil) {
                                Text("Cербский алфавит")
                                Spacer()
                                Menu {
                                    Button {
                                        settings_srb_alphabet = "Кириллица"
                                    } label: {
                                        Text("Кириллица")
                                    }
                                    Button {
                                        settings_srb_alphabet = "Латиница"
                                    } label: {
                                        Text("Латиница")
                                    }
                                } label: {
                                    Text(settings_srb_alphabet)
                                        .foregroundColor(Color(colorPrimary))
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.footnote)
                                        .foregroundColor(Color.gray)
                                }
                            }
                            .padding(Edge.Set.leading, 24)
                            .padding(Edge.Set.trailing, 24)
                            
                            HStack {
                                Text("Отображение ударений")
                                Spacer()
                            }
                            .padding(Edge.Set.top)
                            .padding(Edge.Set.leading, 24)
                            .padding(Edge.Set.trailing, 24)
                            
                            HStack(spacing: nil) {
                                Text("в сербских словах")
                                Spacer()
                                StressChoiceView(settings_stress: $settings_srb_stress, colorText: colorPrimary)
                            }
                            .padding(Edge.Set.leading, 24)
                            .padding(Edge.Set.trailing, 24)
                            
                            HStack(spacing: nil) {
                                Text("в русских словах")
                                Spacer()
                                StressChoiceView(settings_stress: $settings_rus_stress, colorText: colorPrimary)
                            }
                            .padding(Edge.Set.leading, 24)
                            .padding(Edge.Set.trailing, 24)
                            .padding(Edge.Set.bottom)
                            
                            SeparateLine()
                        }
                        
                        Group {
                            HStack {
                                Text("Оформление".uppercased())
                                    .foregroundColor(Color(setGroupTitelColor))
                                Spacer()
                            }
                            .padding(Edge.Set.leading, 24)
                            .padding(Edge.Set.trailing, 24)
                            
                            SeparateLine(size: 0.5)
                            
                            HStack {
                                Spacer()
                                ThemeImageView(image: themeLight, title: "Светлая тема", theme: true, currentTheme: $currentTheme)
                                Spacer()
                                ThemeImageView(image: themeDark, title: "Темная тема", theme: false, currentTheme: $currentTheme)
                                Spacer()
                            }
                            .padding(Edge.Set.bottom, nil)
                            
                            SeparateLine()
                        }
                        
                        Group {
                            HStack {
                                Text("О программе")
                                Spacer()
                            }
                            .padding(Edge.Set.bottom, nil)
                            
                            SeparateLine(size: 0.5)
                            
                            HStack {
                                Text("Справка")
                                Spacer()
                            }
                        }
                        .padding(Edge.Set.leading, 24)
                        .padding(Edge.Set.trailing, 24)
                        
                        SeparateLine()
                        
                        ForEach(0..<10) {index in
                            Text("\(index)")
                        }
                    }
                }
            }
        }
        .background(Color(currentTheme ? mainBackcolor : mainBackcolorDark))
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
    

struct StressChoiceView: View {
    
    @Binding var settings_stress: String
    var colorText: UIColor = #colorLiteral(red: 0.9960784314, green: 0.2235294118, blue: 0.1176470588, alpha: 1)
    
    var body: some View {
        Menu {
            Button {
                settings_stress = "Нет"
            } label: {
                Text("Нет")
                //Image(systemName: "arrow.down.right.circle")
            }
            Button {
                settings_stress = "Знак"
            } label: {
                Text("Знак")
                //Image(systemName: "arrow.up.and.down.circle")
            }
            Button {
                settings_stress = "Цвет"
            } label: {
                Text("Цвет")
                //Image(systemName: "arrow.up.and.down.circle")
            }
        } label: {
            Text(settings_stress)
                .foregroundColor(Color(colorText))
            Image(systemName: "arrowtriangle.down.fill")
                .font(.footnote)
                .foregroundColor(Color.gray)
        }
    }
}

struct SeparateLine: View {

    let separatorColor: UIColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
    var size: CGFloat = 1
    
    var body: some View {
        Color(separatorColor)
            .frame(width: .infinity, height: size)
            .padding(Edge.Set.bottom, nil)
    }
}

struct ThemeImageView: View {
    
    var image: UIImage
    var title: String
    var theme: Bool
    @Binding var currentTheme: Bool
    
    var body: some View {
        VStack {
            Button {
                currentTheme = theme
            } label: {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 110, height: 200)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 5, x: 5, y: 5)
                    .padding(Edge.Set.bottom, 8)
            }

            Text(title)
        }
    }
}
