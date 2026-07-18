# typed: strong

module Cadenya
  module Models
    class GlobalAPIKeyEnableParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::GlobalAPIKeyEnableParams, Cadenya::Internal::AnyHash)
        end

      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Cadenya::RequestOptions }) }
      def to_hash
      end
    end
  end
end
