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

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :hints

        sig { params(hints: T::Array[String]).void }
        attr_writer :hints

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_tools

        sig { params(max_tools: Integer).void }
        attr_writer :max_tools

        # Rerank Threshold is an optional value that instructs whether or not to run a
        # search result through a embedding/reranker process which can improve performance
        # and reduce context bloat when tools reach the configured threshold. If a tool
        # match must exceed 0.8, for example, the tool very closely match the query the
        # tool search performed.
        sig { returns(T.nilable(Float)) }
        attr_reader :rerank_threshold

        sig { params(rerank_threshold: Float).void }
        attr_writer :rerank_threshold

        # ProgressiveDiscovery is used to indicate that the agent should automatically
        # discover tools that are not explicitly assigned to it. Max tools is the maximum
        # number of tools that can be discovered per search. Hints are optional hints for
        # tool search. These are used in conjunction with the context-aware tool search
        # and can help select the best tools for the task.
        sig do
          params(
            hints: T::Array[String],
            max_tools: Integer,
            rerank_threshold: Float
          ).returns(T.attached_class)
        end
        def self.new(
          hints: nil,
          max_tools: nil,
          # Rerank Threshold is an optional value that instructs whether or not to run a
          # search result through a embedding/reranker process which can improve performance
          # and reduce context bloat when tools reach the configured threshold. If a tool
          # match must exceed 0.8, for example, the tool very closely match the query the
          # tool search performed.
          rerank_threshold: nil
        )
        end

        sig do
          override.returns(
            {
              hints: T::Array[String],
              max_tools: Integer,
              rerank_threshold: Float
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
