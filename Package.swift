// swift-tools-version:5.8
import PackageDescription

let package = Package(
	name: "OPML",
    platforms: [.iOS(.v15), .macOS(.v12)],
	products: [
		.library(name: "OPML", targets: ["OPML"])
	],
	dependencies: [
		.package(name: "Html", url: "https://github.com/pointfreeco/swift-html", from: "0.4.1")
	],
	targets: [
		.target(name: "OPML", dependencies: [
            .product(name: "Html", package: "swift-html"),
        ])/*,
		.testTarget(
			name: "OPMLTests",
			dependencies: ["OPML"],
			resources: [.process("Resources")]
		)
	]
)
