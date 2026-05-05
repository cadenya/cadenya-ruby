# typed: strong

module Cadenya
  module Models
    class WorkspaceSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::WorkspaceSpec, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { params(description: String).returns(T.attached_class) }
      def self.new(description: nil)
      end

      sig { override.returns({ description: String }) }
      def to_hash
      end
    end
  end
end
