# typed: strong

module Cadenya
  module Models
    VariationAssignmentAgent = Agents::VariationAssignmentAgent

    module Agents
      class VariationAssignmentAgent < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationAssignmentAgent,
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
        attr_reader :agent

        sig { params(agent: Cadenya::BareMetadata::OrHash).void }
        attr_writer :agent

        sig do
          returns(Cadenya::Agents::VariationAssignmentAgent::Type::TaggedSymbol)
        end
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig do
          params(
            agent: Cadenya::BareMetadata::OrHash,
            type: Cadenya::Agents::VariationAssignmentAgent::Type::OrSymbol,
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
          agent:,
          type:,
          id: nil
        )
        end

        sig do
          override.returns(
            {
              agent: Cadenya::BareMetadata,
              type:
                Cadenya::Agents::VariationAssignmentAgent::Type::TaggedSymbol,
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
              T.all(Symbol, Cadenya::Agents::VariationAssignmentAgent::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT =
            T.let(
              :agent,
              Cadenya::Agents::VariationAssignmentAgent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::VariationAssignmentAgent::Type::TaggedSymbol
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
