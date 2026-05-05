# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryInfo < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntryInfo,
              Cadenya::Internal::AnyHash
            )
          end

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :created_by

        sig { params(created_by: Cadenya::Profile::OrHash).void }
        attr_writer :created_by

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
        attr_reader :memory_layer

        sig { params(memory_layer: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :memory_layer

        sig do
          params(
            created_by: Cadenya::Profile::OrHash,
            memory_layer: Cadenya::ResourceMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          created_by: nil,
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          memory_layer: nil
        )
        end

        sig do
          override.returns(
            {
              created_by: Cadenya::Profile,
              memory_layer: Cadenya::ResourceMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
