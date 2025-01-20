// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXDataLayer",
	platforms: [.iOS("13.0"), .watchOS("9.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXDataLayer",
			targets: ["GXDataLayerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "3.0.0-rc.8")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXDataLayer-3.0.0-rc.8.xcframework.zip",
			checksum: "516b8b76b7f36043ece75f201d3ff0ab397b4682bd2252f0a2eb87b9b3fe90c6"
		)
	]
)