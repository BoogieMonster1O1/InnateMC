//
// Copyright © 2022 Shrish Deshpande
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see &lt;http://www.gnu.org/licenses/&gt;.
//

import SwiftUI
import InnateKit

struct InstanceView: View {
    @State var instance: Instance
    @AppStorage("innatemc.rightAlignedInstanceHeading") private var rightAlignedInstanceHeading: Bool = false
    @State var disabled: Bool = false
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    if !rightAlignedInstanceHeading {
                        Spacer()
                    }
                    Text(instance.name)
                        .font(.largeTitle)
                    if instance.isStarred {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .onTapGesture {
                                instance.isStarred = false
                            }
                            .frame(width: 16, height: 16)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.gray)
                            .onTapGesture {
                                instance.isStarred = true
                            }
                            .frame(width: 16, height: 16)
                    }
                    Spacer()
                }
                HStack {
                    if !rightAlignedInstanceHeading {
                        Spacer()
                    }
                    Text(instance.someDebugString)
                        .font(.caption)
                        .padding(.all, 6)
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    if instance.description != nil {
                        Text(instance.description!)
                            .font(.body)
                    }
                    Spacer()
                }
                Spacer()
                TabView {
                    InstanceLaunchView(instance: instance)
                    .tabItem {
                        Label("Launch", systemImage: "bolt")
                    }
                    TodoView()
                        .tabItem {
                            Label("Runtime", systemImage: "bolt")
                        }
                    TodoView()
                        .tabItem {
                            Label("Mods", systemImage: "bolt")
                        }
                    TodoView()
                        .tabItem {
                            Label("Resource Packs", systemImage: "bolt")
                        }
                    TodoView()
                        .tabItem {
                            Label("Worlds", systemImage: "bolt")
                        }
                    TodoView()
                        .tabItem {
                            Label("Screenshots", systemImage: "bolt")
                        }
                    TodoView()
                        .tabItem {
                            Label("Misc", systemImage: "bolt")
                        }
                }.padding(.all, 4)
            }
            .padding(.all, 6)
        }
    }
}
