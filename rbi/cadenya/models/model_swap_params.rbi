# typed: strong

module Cadenya
  module Models
    class ModelSwapParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ModelSwapParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      # The swaps to perform.
      sig { returns(T.nilable(T::Array[Cadenya::ModelSwapParams::ModelSwap])) }
      attr_reader :model_swaps

      sig do
        params(
          model_swaps: T::Array[Cadenya::ModelSwapParams::ModelSwap::OrHash]
        ).void
      end
      attr_writer :model_swaps

      sig do
        params(
          workspace_id: String,
          model_swaps: T::Array[Cadenya::ModelSwapParams::ModelSwap::OrHash],
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        # The swaps to perform.
        model_swaps: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            model_swaps: T::Array[Cadenya::ModelSwapParams::ModelSwap],
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      class ModelSwap < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ModelSwapParams::ModelSwap,
              Cadenya::Internal::AnyHash
            )
          end

        # The model variations are currently on. Accepts an id or "external_id:" slug.
        sig { returns(T.nilable(String)) }
        attr_reader :current_model_id

        sig { params(current_model_id: String).void }
        attr_writer :current_model_id

        # Whether to disable the current model after the swap.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :disable_current_after_swap

        sig { params(disable_current_after_swap: T::Boolean).void }
        attr_writer :disable_current_after_swap

        # The model to move variations to. Accepts an id or "external_id:" slug.
        sig { returns(T.nilable(String)) }
        attr_reader :next_model_id

        sig { params(next_model_id: String).void }
        attr_writer :next_model_id

        sig do
          params(
            current_model_id: String,
            disable_current_after_swap: T::Boolean,
            next_model_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The model variations are currently on. Accepts an id or "external_id:" slug.
          current_model_id: nil,
          # Whether to disable the current model after the swap.
          disable_current_after_swap: nil,
          # The model to move variations to. Accepts an id or "external_id:" slug.
          next_model_id: nil
        )
        end

        sig do
          override.returns(
            {
              current_model_id: String,
              disable_current_after_swap: T::Boolean,
              next_model_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
