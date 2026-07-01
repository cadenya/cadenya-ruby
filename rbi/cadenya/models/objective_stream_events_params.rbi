# typed: strong

module Cadenya
  module Models
    class ObjectiveStreamEventsParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveStreamEventsParams,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(String) }
      attr_accessor :objective_id

      sig do
        params(
          workspace_id: String,
          objective_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(workspace_id:, objective_id:, request_options: {})
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            objective_id: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
