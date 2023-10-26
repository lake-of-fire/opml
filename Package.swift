// swift-tools-version:5.8
import PackageDescription

let package = Package(
	name: "OPML",
    platforms: [.iOS(.v15), .macOS(.v12)],
	products: [
		.library(name: "OPML", targets: ["OPML"])
	],
	dependencies: [
        .package(url: "https://github.com/lake-of-fire/swift-html.git", branch: "main")
	],
	targets: [
		.target(name: "OPML", dependencies: [
            .product(name: "Html", package: "swift-html"),
        ])/*,
		.testTarget(
			name: "Tests",
			dependencies: ["OPML"]
		)*/
	]
)
