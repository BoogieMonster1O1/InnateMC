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
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import SwiftUI

struct RuntimePreferencesView: View {
    let columns = [GridItem(.fixed(200), alignment: .trailing), GridItem(.flexible(), alignment: .leading)]
    
    @AppStorage("innatemc.javaExecutable") private var javaExecutable: String = "java"
    @AppStorage("innatemc.minMemory") private var minMemory: Int = 1024
    @AppStorage("innatemc.maxMemory") private var maxMemory: Int = 1024
    @AppStorage("innatemc.javaArgs") private var javaArgs: String = ""

    var body: some View {
        Form {
            LazyVGrid(columns: columns) {
                Text("Default Java executable")
                TextField("", text: $javaExecutable).frame(minWidth: nil, idealWidth: nil, maxWidth: 550, minHeight: nil, maxHeight: nil).textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Default Minimum Memory (MiB)")
                TextField("", value: $minMemory, formatter: NumberFormatter()).frame(minWidth: nil, idealWidth: nil, maxWidth: 550, minHeight: nil, maxHeight: nil).textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Default Maximum Memory (MiB)")
                TextField("", value: $maxMemory, formatter: NumberFormatter()).frame(minWidth: nil, idealWidth: nil, maxWidth: 550, minHeight: nil, maxHeight: nil).textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Default Java Arguments")
                TextField("", text: $javaArgs).frame(minWidth: nil, idealWidth: nil, maxWidth: 550, minHeight: nil, maxHeight: nil).textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .padding(.all, 16.0)
    }
}

struct RuntimePreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        RuntimePreferencesView()
    }
}
