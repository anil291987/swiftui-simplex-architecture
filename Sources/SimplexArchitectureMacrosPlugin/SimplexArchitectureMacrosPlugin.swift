#if canImport(SwiftCompilerPlugin)
import SwiftSyntaxMacros
import SwiftCompilerPlugin

@main
struct SimplexArchitectureMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ScopedState.self
    ]
}
#endif
