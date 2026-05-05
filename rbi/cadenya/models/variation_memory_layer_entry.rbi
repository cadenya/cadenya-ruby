# typed: strong

module Cadenya
  module Models
    class VariationMemoryLayerEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::VariationMemoryLayerEntry, Cadenya::Internal::AnyHash)
        end

      # external_id:<value> form. Canonical IDs are rejected.
      sig { returns(T.nilable(String)) }
      attr_reader :memory_layer_id

      sig { params(memory_layer_id: String).void }
      attr_writer :memory_layer_id

      sig { returns(T.nilable(Integer)) }
      attr_reader :position

      sig { params(position: Integer).void }
      attr_writer :position

      sig do
        params(memory_layer_id: String, position: Integer).returns(
          T.attached_class
        )
      end
      def self.new(
        # external_id:<value> form. Canonical IDs are rejected.
        memory_layer_id: nil,
        position: nil
      )
      end

      sig { override.returns({ memory_layer_id: String, position: Integer }) }
      def to_hash
      end
    end
  end
end
