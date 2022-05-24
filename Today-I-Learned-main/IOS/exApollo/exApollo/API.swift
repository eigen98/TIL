// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class QueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Query {
      totalTripsBooked
    }
    """

  public let operationName: String = "Query"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("totalTripsBooked", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalTripsBooked: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "totalTripsBooked": totalTripsBooked])
    }

    public var totalTripsBooked: Int? {
      get {
        return resultMap["totalTripsBooked"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalTripsBooked")
      }
    }
  }
}
