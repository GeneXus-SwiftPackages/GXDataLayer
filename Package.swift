// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXDataLayer",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXDataLayer",
			targets: ["GXDataLayerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.0.0-beta.20230630204809"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.0.0-beta.20230630204809"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.0.0-beta.20230630204809")
	],
	targets: [
		.target(name: "GXDataLayerWrapper",
				dependencies: [
					"GXDataLayer",
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS, .tvOS, .watchOS])),
					.product(name: "YAJL", package: "YAJL", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayer",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayer-1.0.0-beta.20230630204809.xcframework.zip",
			checksum: "b570bf7699c1554f6295492b3d571a3bec33aa3ab0e0e534b71c0195594d6b65"
		)
	]
)