// swift-tools-version:5.7
import PackageDescription

let package = Package(
	name: "OPML",
	products: [
		.library(name: "OPML", targets: ["OPML"])
	],
	dependencies: [
        .package(url: "https://github.com/hallee/swift-html.git", branch: "main")
	],
	targets: [
		.target(name: "OPML", dependencies: [
            .product(name: "Html", package: "swift-html"),
        ]),
		.testTarget(
			name: "Tests",
			dependencies: ["OPML"]
		)
	]
)
