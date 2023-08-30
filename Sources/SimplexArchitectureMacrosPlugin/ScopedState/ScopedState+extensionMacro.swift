import SwiftSyntax
import SwiftSyntaxMacros

extension ScopedState: ExtensionMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol,
        conformingTo protocols: [SwiftSyntax.TypeSyntax],
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            return []
        }
        if let inheritedTypes = structDecl.inheritanceClause?.inheritedTypes,
           inheritedTypes.contains(where: { inherited in inherited.type.trimmedDescription == "SimplexStoreView" }) {
            return []
        }
        let declSyntax: DeclSyntax =
            """
            extension \(type.trimmed): SimplexStoreView {}
            """
        return [
            declSyntax.cast(ExtensionDeclSyntax.self)
        ]
    }
}
