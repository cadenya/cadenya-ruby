# typed: strong

module Cadenya
  module Models
    class AIProviderCredentialHeaders < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::AIProviderCredentialHeaders,
            Cadenya::Internal::AnyHash
          )
        end

      # CredentialHeaders carries arbitrary HTTP headers sent with every request to the
      # provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
      sig { returns(Cadenya::AIProviderCredentialHeaders::Headers) }
      attr_reader :headers

      sig do
        params(
          headers: Cadenya::AIProviderCredentialHeaders::Headers::OrHash
        ).void
      end
      attr_writer :headers

      sig { returns(Cadenya::AIProviderCredentialHeaders::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          headers: Cadenya::AIProviderCredentialHeaders::Headers::OrHash,
          type: Cadenya::AIProviderCredentialHeaders::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # CredentialHeaders carries arbitrary HTTP headers sent with every request to the
        # provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
        headers:,
        type:
      )
      end

      sig do
        override.returns(
          {
            headers: Cadenya::AIProviderCredentialHeaders::Headers,
            type: Cadenya::AIProviderCredentialHeaders::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Headers < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AIProviderCredentialHeaders::Headers,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :headers

        sig { params(headers: T::Hash[Symbol, String]).void }
        attr_writer :headers

        # CredentialHeaders carries arbitrary HTTP headers sent with every request to the
        # provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
        sig do
          params(headers: T::Hash[Symbol, String]).returns(T.attached_class)
        end
        def self.new(headers: nil)
        end

        sig { override.returns({ headers: T::Hash[Symbol, String] }) }
        def to_hash
        end
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::AIProviderCredentialHeaders::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HEADERS =
          T.let(
            :headers,
            Cadenya::AIProviderCredentialHeaders::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::AIProviderCredentialHeaders::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
