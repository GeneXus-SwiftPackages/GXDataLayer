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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.4.0-rc.21")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXDataLayer-1.4.0-rc.21.xcframework.zip",
			checksum: "c361bdce82500a589853234f0261883009ab8c8b0216724026cc9326766a65ce"
		)
	]
)