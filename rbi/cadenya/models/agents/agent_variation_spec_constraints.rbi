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
          params(max_sub_objectives: Integer, max_tool_calls: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The maximum number of sub-objectives that can be created. 0 means no limit.
          max_sub_objectives: nil,
          # The maximum number of tool calls that can be made. 0 means no limit.
          max_tool_calls: nil
        )
        end

        sig do
          override.returns(
            { max_sub_objectives: Integer, max_tool_calls: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
