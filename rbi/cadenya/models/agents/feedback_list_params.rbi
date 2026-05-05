# typed: strong

module Cadenya
  module Models
    module Agents
      class FeedbackListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::FeedbackListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        # Optional filter to limit results to feedback on objectives run by a single agent
        # variation. Supports "external_id:" prefix for external IDs.
        sig { returns(T.nilable(String)) }
        attr_reader :agent_variation_id

        sig { params(agent_variation_id: String).void }
        attr_writer :agent_variation_id

        # Inclusive lower bound on feedback creation time.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_after

        sig { params(created_after: Time).void }
        attr_writer :created_after

        # Exclusive upper bound on feedback creation time.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_before

        sig { params(created_before: Time).void }
        attr_writer :created_before

        # Pagination cursor from previous response.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # When set to true you may use more of your alloted API rate-limit
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_info

        sig { params(include_info: T::Boolean).void }
        attr_writer :include_info

        # Maximum number of results to return.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Free-text search applied to the feedback comment. Case-insensitive substring
        # match.
        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        # Filter by sentiment. UNSPECIFIED returns feedback regardless of score.
        sig do
          returns(
            T.nilable(Cadenya::Agents::FeedbackListParams::Sentiment::OrSymbol)
          )
        end
        attr_reader :sentiment

        sig do
          params(
            sentiment: Cadenya::Agents::FeedbackListParams::Sentiment::OrSymbol
          ).void
        end
        attr_writer :sentiment

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            agent_variation_id: String,
            created_after: Time,
            created_before: Time,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            query: String,
            sentiment: Cadenya::Agents::FeedbackListParams::Sentiment::OrSymbol,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          # Optional filter to limit results to feedback on objectives run by a single agent
          # variation. Supports "external_id:" prefix for external IDs.
          agent_variation_id: nil,
          # Inclusive lower bound on feedback creation time.
          created_after: nil,
          # Exclusive upper bound on feedback creation time.
          created_before: nil,
          # Pagination cursor from previous response.
          cursor: nil,
          # When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Maximum number of results to return.
          limit: nil,
          # Free-text search applied to the feedback comment. Case-insensitive substring
          # match.
          query: nil,
          # Filter by sentiment. UNSPECIFIED returns feedback regardless of score.
          sentiment: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              agent_variation_id: String,
              created_after: Time,
              created_before: Time,
              cursor: String,
              include_info: T::Boolean,
              limit: Integer,
              query: String,
              sentiment:
                Cadenya::Agents::FeedbackListParams::Sentiment::OrSymbol,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Filter by sentiment. UNSPECIFIED returns feedback regardless of score.
        module Sentiment
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Agents::FeedbackListParams::Sentiment)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FEEDBACK_SENTIMENT_UNSPECIFIED =
            T.let(
              :FEEDBACK_SENTIMENT_UNSPECIFIED,
              Cadenya::Agents::FeedbackListParams::Sentiment::TaggedSymbol
            )
          FEEDBACK_SENTIMENT_POSITIVE =
            T.let(
              :FEEDBACK_SENTIMENT_POSITIVE,
              Cadenya::Agents::FeedbackListParams::Sentiment::TaggedSymbol
            )
          FEEDBACK_SENTIMENT_NEGATIVE =
            T.let(
              :FEEDBACK_SENTIMENT_NEGATIVE,
              Cadenya::Agents::FeedbackListParams::Sentiment::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::FeedbackListParams::Sentiment::TaggedSymbol
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
