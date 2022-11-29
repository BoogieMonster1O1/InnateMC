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

import XCTest
import InnateKit

class InstanceTests: XCTestCase {
    private var manifest: [ManifestVersion] = []

    override func setUpWithError() throws {
        manifest = try VersionManifest.download()
    }

    override func tearDownWithError() throws {
        manifest = []
    }

    func testCreateVanillaInstance() throws {
        let fm = FileManager.default
        let manver = manifest.randomElement()!
        let url = FileHandler.instancesFolder.appendingPathComponent("TestX.innate", isDirectory: true)
        if (fm.fileExists(atPath: url.path)) {
            try fm.removeItem(at: url)
        }
        let ctor = VanillaInstanceCreator(name: "TestX", versionUrl: URL(string: manver.url)!, sha1: manver.sha1)
        let expected = try ctor.install()
        let actual = try Instance.loadFromDirectory(url)
        XCTAssertEqual(expected.name, actual.name)
    }
}