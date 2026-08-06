# typed: strong

module Cadenya
  module Models
    class ToolSetSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolSetSpec, Cadenya::Internal::AnyHash) }

      sig { returns(T.nilable(Cadenya::ToolSetAdapter)) }
      attr_reader :adapter

      sig { params(adapter: Cadenya::ToolSetAdapter::OrHash).void }
      attr_writer :adapter

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          adapter: Cadenya::ToolSetAdapter::OrHash,
          description: String
        ).returns(T.attached_class)
      end
      def self.new(adapter: nil, description: nil)
      end

      sig do
        override.returns(
          { adapter: Cadenya::ToolSetAdapter, description: String }
        )
      end
      def to_hash
      end
    end
  end
end
