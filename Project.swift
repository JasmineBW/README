import ProjectDescription
//import ProjectDescriptionHelpers

let project = Project.init(
    name: "Read.me",
    organizationName: "TeamName",
    packages: [
        .package(url: "https://github.com/alexanderwe/LoggingKit", .exact("3.0.0")),
    ],
    targets: [
        .init(name: "Read.me (iOS)",
              platform: .iOS,
              product: .app,
              productName: "Read.me",
              bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
              infoPlist: .extendingDefault(with: [
                "CFBundleShortVersionString": .string("0.0.1"),
                "CFBundleVersion": .string("1"),
                "CFBundleIdentifier": .string("$(PRODUCT_BUNDLE_IDENTIFIER)"),
                "CFBundleDisplayName": .string("Read.me$(SERVER_ENVIRONMENT_SUFFIX)"),
                "UIApplicationSceneManifest" : .dictionary([
                    "UIApplicationSupportsMultipleScenes": .boolean(true),
                    "UISceneConfigurations": .dictionary([
                        "UIWindowSceneSessionRoleApplication": .array([
                            .dictionary([
                                "UISceneConfigurationName": "Default Configuration",
                                "UISceneDelegateClassName":"$(PRODUCT_MODULE_NAME).SceneDelegate"
                            ])
                        ])
                    ])
                ]),
                "UIApplicationSupportsIndirectInputEvents": .boolean(true),
                "UILaunchScreen": .dictionary([:]),
                "_ServerEnvironment": .string("$(SERVER_ENVIRONMENT)")
              ]),
              sources: [
                "Targets/iOS/Sources/**"
              ], resources: [
                "Targets/iOS/Resources/**",
                "Targets/iOS/SupportingFiles/**"
              ],
              actions: [
                TargetAction.pre(path: "Scripts/SwiftFormatRunScript.sh",
                                 arguments: "",
                                 name: "Swiftformat (LintMode)")
              ],
              dependencies: [
                .target(name: "Read.meKit")
              ],
              settings: Settings(
                debug: Configuration(xcconfig: "Targets/iOS/SupportingFiles/Config/Configuration.xcconfig"),
                release: Configuration(xcconfig: "Targets/iOS/SupportingFiles/Config/Configuration.xcconfig")
              )
        ),
        .init(name: "Tests iOS",
              platform: .iOS,
              product: .unitTests,
              productName: "Tests_iOS",
              bundleId: "com.example.read.me-ios-tests",
              infoPlist: .default,
              sources: [
                "Targets/iOS/Tests/UnitTests/**"
              ],
              dependencies: [
                .target(name: "Read.me (iOS)")
              ]
        ),
        .init(name: "UI Tests iOS",
              platform: .iOS,
              product: .uiTests,
              productName: "UI_Tests_iOS",
              bundleId: "com.example.read.me-ios-ui-tests",
              infoPlist: .default,
              sources: [
                "Targets/iOS/Tests/UITests/**"
              ],
              dependencies: [
                .target(name: "Read.me (iOS)")
              ]
        ),
        .init(name: "Read.meKit",
              platform: .iOS,
              product: .framework,
              productName: "Read.meKit",
              bundleId: "com.example.read.mekit",
              infoPlist: .default,
              sources: [
                "Targets/Read.meKit/Sources/**"
              ],
              dependencies: [
                .package(product: "LoggingKit")
              ]
        ),
        .init(name: "Read.meKit Tests",
              platform: .iOS,
              product: .unitTests,
              productName: "Tests_Read.meKit",
              bundleId: "com.example.read.mekit-tests",
              infoPlist: .default,
              sources: [
                "Targets/Read.meKit/Tests/**"
              ],
              dependencies: [
                .target(name: "Read.me (iOS)")
              ]
        ),
    ],
    schemes: [
        .init(name: "Read.me (iOS) Development",
              shared: true,
              buildAction: BuildAction(targets: ["Read.me (iOS)"],
                                       preActions: [
                                        .init(scriptText: "cp -f \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Development.xcconfig\" \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Configuration.xcconfig\"",
                                              target: "Read.me (iOS)"
                                       )]
              ),
              testAction: TestAction(targets: ["Tests iOS", "UI Tests iOS"]),
              runAction: RunAction(executable: "Read.me (iOS)")
        ),
         .init(name: "Read.me (iOS) Staging",
              shared: true,
              buildAction: BuildAction(targets: ["Read.me (iOS)"],
                                       preActions: [
                                        .init(scriptText: "cp -f \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Staging.xcconfig\" \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Configuration.xcconfig\"",
                                              target: "Read.me (iOS)"
                                        )]
              ),
              testAction: TestAction(targets: ["Tests iOS", "UI Tests iOS"]),
              runAction: RunAction(executable: "Read.me (iOS)")
        ),
        .init(name: "Read.me (iOS) Production",
              shared: true,
              buildAction: BuildAction(targets: ["Read.me (iOS)"],
                                       preActions: [
                                        .init(scriptText: "cp -f \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Production.xcconfig\" \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Configuration.xcconfig\"",
                                              target: "Read.me (iOS)"
                                        )]
              ),
              testAction: TestAction(targets: ["Tests iOS", "UI Tests iOS"]),
              runAction: RunAction(executable: "Read.me (iOS)")
        ),
        .init(name: "Read.meKit",
              shared: true,
              testAction: TestAction(targets: ["Read.meKit Tests"])
        ),
    ]
)
