# typed: strong

module Cadenya
  module Models
    AgentVariationSpecConstraints = Agents::AgentVariationSpecConstraints

    module Agents
      class AgentVariationSpecConstraints < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentVariationSpecConstraints,
              Cadenya::Internal::AnyHash
            )
          end

        # How long an objective may sit with no activity (no user messages, no LLM calls)
        # before it is finalized as timed out. Between 1 minute and 24 hours. When not
        # set, objectives are still swept at the system-wide 24 hour maximum — every
        # objective eventually reaches a terminal state.
        sig { returns(T.nilable(Integer)) }
        attr_reader :inactivity_timeout

        sig { params(inactivity_timeout: Integer).void }
        attr_writer :inactivity_timeout

        # The maximum number of sub-objectives that can be created. 0 means no limit.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_sub_objectives

        sig { params(max_sub_objectives: Integer).void }
        attr_writer :max_sub_objectives

        # The maximum number of tool calls that can be made. 0 means no limit.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_tool_calls

        sig { params(max_tool_calls: Integer).void }
        attr_writer :max_tool_calls

        sig do
          params(
            inactivity_timeout: Integer,
            max_sub_objectives: Integer,
            max_tool_calls: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # How long an objective may sit with no activity (no user messages, no LLM calls)
          # before it is finalized as timed out. Between 1 minute and 24 hours. When not
          # set, objectives are still swept at the system-wide 24 hour maximum — every
          # objective eventually reaches a terminal state.
          inactivity_timeout: nil,
          # The maximum number of sub-objectives that can be created. 0 means no limit.
          max_sub_objectives: nil,
          # The maximum number of tool calls that can be made. 0 means no limit.
          max_tool_calls: nil
        )
        end

        sig do
          override.returns(
            {
              inactivity_timeout: Integer,
              max_sub_objectives: Integer,
              max_tool_calls: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
