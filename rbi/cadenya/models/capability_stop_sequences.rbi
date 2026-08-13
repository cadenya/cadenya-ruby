# typed: strong

module Cadenya
  module Models
    class CapabilityStopSequences < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::CapabilityStopSequences, Cadenya::Internal::AnyHash)
        end

      # Maximum number of stop sequences the model accepts per request. 0 means the
      # provider imposes no meaningful limit.
      sig { returns(Integer) }
      attr_accessor :limit

      # Custom stop sequences (ModelConfig.stop_sequences).
      sig { params(limit: Integer).returns(T.attached_class) }
      def self.new(
        # Maximum number of stop sequences the model accepts per request. 0 means the
        # provider imposes no meaningful limit.
        limit:
      )
      end

      sig { override.returns({ limit: Integer }) }
      def to_hash
      end
    end
  end
end
