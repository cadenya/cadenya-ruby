# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Agents::FeedbackTest < Cadenya::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.feedback.list(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Objectives::ObjectiveFeedback
    end

    assert_pattern do
      row => {
        data: Cadenya::Objectives::ObjectiveFeedbackData,
        metadata: Cadenya::OperationMetadata,
        info: Cadenya::Objectives::ObjectiveFeedbackInfo | nil
      }
    end
  end
end
