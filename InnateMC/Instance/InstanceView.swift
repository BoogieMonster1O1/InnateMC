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
    var instance: Instance
    @AppStorage("innatemc.rightAlignedInstanceHeading") private var rightAlignedInstanceHeading: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    if !rightAlignedInstanceHeading {
                        Spacer()
                    }
                    Text(instance.name)
                        .font(.largeTitle)
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
            }
            .padding(.all, 6)
        }
    }
}

struct InstanceView_Previews: PreviewProvider {
    static var previews: some View {
        let instance: Instance = Instance(name: "Test Instance", assetIndex: PartialAssetIndex(id: "bruh", sha1: "bruh", url: "bruh"), libraries: [], mainClass: "bruh", minecraftJar: MinecraftJar(type: .local, url: nil, sha1: nil), isStarred: false, logo: "", description: "A very concerning test instance that absolutely will not work. Why are you even looking at this? Bruh", debugString: "c0.21, Textile")
        InstanceView(instance: instance)
            .frame(width: 600)
    }
}