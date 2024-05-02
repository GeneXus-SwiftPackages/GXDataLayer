// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXDataLayer",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXDataLayer",
			targets: ["GXDataLayerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "2.0.0-beta.20")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayer-2.0.0-beta.20.xcframework.zip",
			checksum: "8264a4aeab26f569451a5a38ffd676407bb6cc2e13bc36eb3b7c8d8c82623bf7"
		)
	]
)