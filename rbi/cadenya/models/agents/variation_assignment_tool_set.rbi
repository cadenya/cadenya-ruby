# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationAssignmentToolSet < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationAssignmentToolSet,
              Cadenya::Internal::AnyHash
            )
          end

        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        sig { returns(Cadenya::BareMetadata) }
        attr_reader :tool_set

        sig { params(tool_set: Cadenya::BareMetadata::OrHash).void }
        attr_writer :tool_set

        sig do
          returns(
            Cadenya::Agents::VariationAssignmentToolSet::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig do
          params(
            tool_set: Cadenya::BareMetadata::OrHash,
            type: Cadenya::Agents::VariationAssignmentToolSet::Type::OrSymbol,
            id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          tool_set:,
          type:,
          id: nil
        )
        end

        sig do
          override.returns(
            {
              tool_set: Cadenya::BareMetadata,
              type:
                Cadenya::Agents::VariationAssignmentToolSet::Type::TaggedSymbol,
              id: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Agents::VariationAssignmentToolSet::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_SET =
            T.let(
              :toolSet,
              Cadenya::Agents::VariationAssignmentToolSet::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::VariationAssignmentToolSet::Type::TaggedSymbol
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
