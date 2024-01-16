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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.4.0-beta.14")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayer-1.4.0-beta.14.xcframework.zip",
			checksum: "cd016cc6eb2265851076af7c3675fb418d031a89838d0ff8a77c93e285f7c078"
		)
	]
)