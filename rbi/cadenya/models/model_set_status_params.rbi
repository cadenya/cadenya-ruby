# typed: strong

module Cadenya
  module Models
    class ModelSetStatusParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ModelSetStatusParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(String) }
      attr_accessor :id

      # The new status for the model
      sig do
        returns(T.nilable(Cadenya::ModelSetStatusParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: Cadenya::ModelSetStatusParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          workspace_id: String,
          id: String,
          status: Cadenya::ModelSetStatusParams::Status::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        id:,
        # The new status for the model
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            id: String,
            status: Cadenya::ModelSetStatusParams::Status::OrSymbol,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The new status for the model
      module Status
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ModelSetStatusParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MODEL_STATUS_UNSPECIFIED =
          T.let(
            :MODEL_STATUS_UNSPECIFIED,
            Cadenya::ModelSetStatusParams::Status::TaggedSymbol
          )
        MODEL_STATUS_ENABLED =
          T.let(
            :MODEL_STATUS_ENABLED,
            Cadenya::ModelSetStatusParams::Status::TaggedSymbol
          )
        MODEL_STATUS_DISABLED =
          T.let(
            :MODEL_STATUS_DISABLED,
            Cadenya::ModelSetStatusParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ModelSetStatusParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
