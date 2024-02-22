// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXDataLayer",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXDataLayer",
			targets: ["GXDataLayerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.5.0-beta.7")
	],
	targets: [
		.target(name: "GXDataLayerWrapper",
				dependencies: [
					"GXDataLayer",
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayer",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayer-1.5.0-beta.7.xcframework.zip",
			checksum: "34346e19bda43551c0fc95927a27d2e90bc7efcca0ce6a04be878421f6cf0413"
		)
	]
)