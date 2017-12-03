// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "HelloKitura",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.0.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.1")),
      .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.7.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-Session.git", from: "2.0.0"),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL.git", from: "0.0.0"),
      ],
    
    targets: [
      .target(name: "HelloKitura", dependencies: [ "Kitura" , "HeliumLogger", "KituraStencil", "KituraSession", "SwiftKuery" ]),
    ]
)
