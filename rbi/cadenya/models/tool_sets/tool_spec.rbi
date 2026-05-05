# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ToolSpec, Cadenya::Internal::AnyHash)
          end

        # Config defines the adapter to use for the tool. This is used to determine how
        # the tool is called. For example, if the tool is an HTTP tool, the adapter will
        # be Http. If the tool is an inline tool, the adapter will be Inline.
        sig { returns(Cadenya::ToolSets::ToolSpecConfig) }
        attr_reader :config

        sig { params(config: Cadenya::ToolSets::ToolSpecConfig::OrHash).void }
        attr_writer :config

        sig { returns(String) }
        attr_accessor :description

        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :parameters

        sig { returns(Cadenya::ToolSets::ToolSpec::Status::OrSymbol) }
        attr_accessor :status

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :requires_approval

        sig { params(requires_approval: T::Boolean).void }
        attr_writer :requires_approval

        sig do
          params(
            config: Cadenya::ToolSets::ToolSpecConfig::OrHash,
            description: String,
            parameters: T::Hash[Symbol, T.anything],
            status: Cadenya::ToolSets::ToolSpec::Status::OrSymbol,
            requires_approval: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Config defines the adapter to use for the tool. This is used to determine how
          # the tool is called. For example, if the tool is an HTTP tool, the adapter will
          # be Http. If the tool is an inline tool, the adapter will be Inline.
          config:,
          description:,
          parameters:,
          status:,
          requires_approval: nil
        )
        end

        sig do
          override.returns(
            {
              config: Cadenya::ToolSets::ToolSpecConfig,
              description: String,
              parameters: T::Hash[Symbol, T.anything],
              status: Cadenya::ToolSets::ToolSpec::Status::OrSymbol,
              requires_approval: T::Boolean
            }
          )
        end
        def to_hash
        end

        module Status
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Cadenya::ToolSets::ToolSpec::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_STATUS_UNSPECIFIED,
              Cadenya::ToolSets::ToolSpec::Status::TaggedSymbol
            )
          TOOL_STATUS_AVAILABLE =
            T.let(
              :TOOL_STATUS_AVAILABLE,
              Cadenya::ToolSets::ToolSpec::Status::TaggedSymbol
            )
          TOOL_STATUS_OMITTED =
            T.let(
              :TOOL_STATUS_OMITTED,
              Cadenya::ToolSets::ToolSpec::Status::TaggedSymbol
            )
          TOOL_STATUS_ARCHIVED =
            T.let(
              :TOOL_STATUS_ARCHIVED,
              Cadenya::ToolSets::ToolSpec::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::ToolSets::ToolSpec::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
