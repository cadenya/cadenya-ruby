# typed: strong

module Cadenya
  module Models
    AgentVariationSpecProgressiveDiscovery =
      Agents::AgentVariationSpecProgressiveDiscovery

    module Agents
      class AgentVariationSpecProgressiveDiscovery < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentVariationSpecProgressiveDiscovery,
              Cadenya::Internal::AnyHash
            )
          end

        # Free-text guidance appended to the discoverable-tools appendix in the system
        # prompt. Hints steer the model's choice of tool names; they do not filter or rank
        # anything, because tool_search matches names exactly rather than searching.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :hints

        sig { params(hints: T::Array[String]).void }
        attr_writer :hints

        # The most tool names tool_search will load in a single call. Requesting more than
        # this returns an error telling the model to retry in smaller batches -- it is a
        # per-call batch limit, not a ceiling on how many tools an objective may end up
        # with.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_tools

        sig { params(max_tools: Integer).void }
        attr_writer :max_tools

        # ProgressiveDiscovery is used to indicate that the agent should automatically
        # discover tools that are not explicitly assigned to it. Max tools is the maximum
        # number of tools that can be discovered per search. Hints are optional hints for
        # tool search. These are used in conjunction with the context-aware tool search
        # and can help select the best tools for the task.
        sig do
          params(hints: T::Array[String], max_tools: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Free-text guidance appended to the discoverable-tools appendix in the system
          # prompt. Hints steer the model's choice of tool names; they do not filter or rank
          # anything, because tool_search matches names exactly rather than searching.
          hints: nil,
          # The most tool names tool_search will load in a single call. Requesting more than
          # this returns an error telling the model to retry in smaller batches -- it is a
          # per-call batch limit, not a ceiling on how many tools an objective may end up
          # with.
          max_tools: nil
        )
        end

        sig do
          override.returns({ hints: T::Array[String], max_tools: Integer })
        end
        def to_hash
        end
      end
    end
  end
end
