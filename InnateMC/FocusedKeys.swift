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

import Foundation
import InnateKit
import SwiftUI

private struct SelectedInstanceKey: FocusedValueKey {
    typealias Value = Binding<Instance>
}

extension FocusedValues {
    var selectedInstance: Binding<Instance>? {
        get { self[SelectedInstanceKey.self] }
        set { self[SelectedInstanceKey.self] = newValue }
    }
}
