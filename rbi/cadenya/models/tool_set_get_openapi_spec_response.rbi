# typed: strong

module Cadenya
  module Models
    class ToolSetGetOpenAPISpecResponse < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::Models::ToolSetGetOpenAPISpecResponse,
            Cadenya::Internal::AnyHash
          )
        end

      # The consumed OpenAPI specification as a JSON string.
      sig { returns(T.nilable(String)) }
      attr_reader :spec

      sig { params(spec: String).void }
      attr_writer :spec

      sig { params(spec: String).returns(T.attached_class) }
      def self.new(
        # The consumed OpenAPI specification as a JSON string.
        spec: nil
      )
      end

      sig { override.returns({ spec: String }) }
      def to_hash
      end
    end
  end
end
