# typed: strong

module Cadenya
  module Models
    class ProfileSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ProfileSpec, Cadenya::Internal::AnyHash) }

      # Whether this profile represents a human user, an API key, or a system principal.
      sig { returns(Cadenya::ProfileSpec::Type::TaggedSymbol) }
      attr_accessor :type

      # Email address of the profile. Required and unique within an account for user
      # profiles.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Display name (e.g., "Bobby Tables").
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Configuration for a profile.
      sig do
        params(
          type: Cadenya::ProfileSpec::Type::OrSymbol,
          email: String,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether this profile represents a human user, an API key, or a system principal.
        type:,
        # Email address of the profile. Required and unique within an account for user
        # profiles.
        email: nil,
        # Display name (e.g., "Bobby Tables").
        name: nil
      )
      end

      sig do
        override.returns(
          {
            type: Cadenya::ProfileSpec::Type::TaggedSymbol,
            email: String,
            name: String
          }
        )
      end
      def to_hash
      end

      # Whether this profile represents a human user, an API key, or a system principal.
      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ProfileSpec::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROFILE_TYPE_UNSPECIFIED =
          T.let(
            :PROFILE_TYPE_UNSPECIFIED,
            Cadenya::ProfileSpec::Type::TaggedSymbol
          )
        PROFILE_TYPE_USER =
          T.let(:PROFILE_TYPE_USER, Cadenya::ProfileSpec::Type::TaggedSymbol)
        PROFILE_TYPE_API_KEY =
          T.let(:PROFILE_TYPE_API_KEY, Cadenya::ProfileSpec::Type::TaggedSymbol)
        PROFILE_TYPE_SYSTEM =
          T.let(:PROFILE_TYPE_SYSTEM, Cadenya::ProfileSpec::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Cadenya::ProfileSpec::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
