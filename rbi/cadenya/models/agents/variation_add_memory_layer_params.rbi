# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationAddMemoryLayerParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationAddMemoryLayerParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(String) }
        attr_accessor :variation_id

        # Layer to attach. Accepts the canonical `memlyr_…` form or the
        # `external_id:<value>` form.
        sig { returns(T.nilable(String)) }
        attr_reader :memory_layer_id

        sig { params(memory_layer_id: String).void }
        attr_writer :memory_layer_id

        # Position in the baseline cascade (lower = more specific). If omitted, the server
        # appends at the most general end (max existing position + 1).
        sig { returns(T.nilable(Integer)) }
        attr_reader :position

        sig { params(position: Integer).void }
        attr_writer :position

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            variation_id: String,
            memory_layer_id: String,
            position: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          variation_id:,
          # Layer to attach. Accepts the canonical `memlyr_…` form or the
          # `external_id:<value>` form.
          memory_layer_id: nil,
          # Position in the baseline cascade (lower = more specific). If omitted, the server
          # appends at the most general end (max existing position + 1).
          position: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              variation_id: String,
              memory_layer_id: String,
              position: Integer,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
