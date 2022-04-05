// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public class DroidDetailsWithFragmentQuery: GraphQLQuery {
  public let operationName: String = "DroidDetailsWithFragment"
  public let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query DroidDetailsWithFragment($episode: Episode) {
        hero(episode: $episode) {
          ...DroidDetails
        }
      }
      """,
      fragments: [DroidDetails.self]
    ))

  public var episode: GraphQLNullable<GraphQLEnum<Episode>>

  public init(episode: GraphQLNullable<GraphQLEnum<Episode>>) {
    self.episode = episode
  }

  public var variables: Variables? {
    ["episode": episode]
  }

  public struct Data: StarWarsAPI.SelectionSet {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Object(StarWarsAPI.Query.self) }
    public static var selections: [Selection] { [
      .field("hero", Hero?.self, arguments: ["episode": .variable("episode")]),
    ] }

    public var hero: Hero? { data["hero"] }

    /// Hero
    public struct Hero: StarWarsAPI.SelectionSet {
      public let data: DataDict
      public init(data: DataDict) { self.data = data }

      public static var __parentType: ParentType { .Interface(StarWarsAPI.Character.self) }
      public static var selections: [Selection] { [
        .typeCase(AsDroid.self),
      ] }

      public var asDroid: AsDroid? { _asType() }

      /// Hero.AsDroid
      public struct AsDroid: StarWarsAPI.TypeCase {
        public let data: DataDict
        public init(data: DataDict) { self.data = data }

        public static var __parentType: ParentType { .Object(StarWarsAPI.Droid.self) }
        public static var selections: [Selection] { [
          .fragment(DroidDetails.self),
        ] }

        public var name: String { data["name"] }
        public var primaryFunction: String? { data["primaryFunction"] }

        public struct Fragments: FragmentContainer {
          public let data: DataDict
          public init(data: DataDict) { self.data = data }

          public var droidDetails: DroidDetails { _toFragment() }
        }
      }
    }
  }
}