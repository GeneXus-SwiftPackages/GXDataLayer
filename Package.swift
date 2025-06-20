// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXDataLayer",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXDataLayer",
			targets: ["GXDataLayerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "3.1.4")
	],
	targets: [
		.target(name: "GXDataLayerWrapper",
				dependencies: [
					"GXDataLayer",
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayer",
			url: "https://pkgs.genexus.dev/iOS/releases/GXDataLayer-3.1.4.xcframework.zip",
			checksum: "d59144b83d04833b5178d7f21bf93443774f6c774c45b0189db83b6fdfdc9a45"
		)
	]
)