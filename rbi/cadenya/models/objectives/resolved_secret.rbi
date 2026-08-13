# typed: strong

module Cadenya
  module Models
    module Objectives
      class ResolvedSecret < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ResolvedSecret,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :key

        sig do
          returns(
            T.nilable(Cadenya::Objectives::ResolvedSecret::Source::TaggedSymbol)
          )
        end
        attr_reader :source

        sig do
          params(
            source: Cadenya::Objectives::ResolvedSecret::Source::OrSymbol
          ).void
        end
        attr_writer :source

        # ResolvedSecret is a resolved secret value from the workspace, toolset, or
        # objective. When a tool is called, it will rely on secrets in the order of:
        #
        # - Objective
        # - Toolset
        # - Workspace
        sig do
          params(
            key: String,
            source: Cadenya::Objectives::ResolvedSecret::Source::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(key: nil, source: nil)
        end

        sig do
          override.returns(
            {
              key: String,
              source: Cadenya::Objectives::ResolvedSecret::Source::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Source
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Objectives::ResolvedSecret::Source)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RESOLVED_SECRET_SOURCE_UNSPECIFIED =
            T.let(
              :RESOLVED_SECRET_SOURCE_UNSPECIFIED,
              Cadenya::Objectives::ResolvedSecret::Source::TaggedSymbol
            )
          RESOLVED_SECRET_SOURCE_WORKSPACE =
            T.let(
              :RESOLVED_SECRET_SOURCE_WORKSPACE,
              Cadenya::Objectives::ResolvedSecret::Source::TaggedSymbol
            )
          RESOLVED_SECRET_SOURCE_TOOLSET =
            T.let(
              :RESOLVED_SECRET_SOURCE_TOOLSET,
              Cadenya::Objectives::ResolvedSecret::Source::TaggedSymbol
            )
          RESOLVED_SECRET_SOURCE_OBJECTIVE =
            T.let(
              :RESOLVED_SECRET_SOURCE_OBJECTIVE,
              Cadenya::Objectives::ResolvedSecret::Source::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ResolvedSecret::Source::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
