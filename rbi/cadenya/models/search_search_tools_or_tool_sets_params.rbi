# typed: strong

module Cadenya
  module Models
    class SearchSearchToolsOrToolSetsParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Cadenya::SearchSearchToolsOrToolSetsParams,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      sig do
        params(
          workspace_id: String,
          query: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(workspace_id: nil, query: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            query: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
