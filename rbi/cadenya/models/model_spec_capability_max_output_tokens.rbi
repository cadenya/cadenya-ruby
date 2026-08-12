# typed: strong

module Cadenya
  module Models
    class ModelSpecCapabilityMaxOutputTokens < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ModelSpecCapabilityMaxOutputTokens,
            Cadenya::Internal::AnyHash
          )
        end

      # Per-request output token cap (ModelConfig.max_output_tokens). The effective
      # ceiling is ModelSpec.max_output_tokens.
      sig { returns(T.anything) }
      attr_accessor :max_output_tokens

      sig do
        returns(Cadenya::ModelSpecCapabilityMaxOutputTokens::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          max_output_tokens: T.anything,
          type: Cadenya::ModelSpecCapabilityMaxOutputTokens::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Per-request output token cap (ModelConfig.max_output_tokens). The effective
        # ceiling is ModelSpec.max_output_tokens.
        max_output_tokens:,
        type:
      )
      end

      sig do
        override.returns(
          {
            max_output_tokens: T.anything,
            type:
              Cadenya::ModelSpecCapabilityMaxOutputTokens::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ModelSpecCapabilityMaxOutputTokens::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MAX_OUTPUT_TOKENS =
          T.let(
            :maxOutputTokens,
            Cadenya::ModelSpecCapabilityMaxOutputTokens::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ModelSpecCapabilityMaxOutputTokens::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
