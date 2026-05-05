# typed: strong

module Cadenya
  module Models
    class ObjectiveCompactParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveCompactParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(String) }
      attr_accessor :objective_id

      # CompactionConfig defines how context window compaction behaves for objectives
      # using this variation.
      sig do
        returns(T.nilable(Cadenya::Agents::AgentVariationSpecCompactionConfig))
      end
      attr_reader :compaction_config

      sig do
        params(
          compaction_config:
            Cadenya::Agents::AgentVariationSpecCompactionConfig::OrHash
        ).void
      end
      attr_writer :compaction_config

      sig do
        params(
          workspace_id: String,
          objective_id: String,
          compaction_config:
            Cadenya::Agents::AgentVariationSpecCompactionConfig::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        objective_id:,
        # CompactionConfig defines how context window compaction behaves for objectives
        # using this variation.
        compaction_config: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            objective_id: String,
            compaction_config:
              Cadenya::Agents::AgentVariationSpecCompactionConfig,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
