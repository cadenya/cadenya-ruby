# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterHTTP < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterHTTP, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :base_url

      sig { params(base_url: String).void }
      attr_writer :base_url

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      sig do
        params(base_url: String, headers: T::Hash[Symbol, String]).returns(
          T.attached_class
        )
      end
      def self.new(base_url: nil, headers: nil)
      end

      sig do
        override.returns({ base_url: String, headers: T::Hash[Symbol, String] })
      end
      def to_hash
      end
    end
  end
end
