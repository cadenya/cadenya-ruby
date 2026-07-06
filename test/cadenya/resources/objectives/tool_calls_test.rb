# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Objectives::ToolCallsTest < Cadenya::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.tool_calls.retrieve(
        "toolCallId",
        workspace_id: "workspaceId",
        objective_id: "objectiveId"
      )

    assert_pattern do
      response => Cadenya::Objectives::ObjectiveToolCallWithResult
    end

    assert_pattern do
      response => {
        data: Cadenya::Objectives::ObjectiveToolCallData,
        execution_status: Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus,
        info: Cadenya::Objectives::ObjectiveToolCallInfo,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::Objectives::ObjectiveToolCallWithResult::Status,
        resolved_secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::Objectives::ResolvedSecret]) | nil,
        result: Cadenya::Objectives::ObjectiveToolCallResult | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.tool_calls.list("objectiveId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Objectives::ObjectiveToolCall
    end

    assert_pattern do
      row => {
        data: Cadenya::Objectives::ObjectiveToolCallData,
        execution_status: Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::Objectives::ObjectiveToolCall::Status,
        info: Cadenya::Objectives::ObjectiveToolCallInfo | nil
      }
    end
  end

  def test_approve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.tool_calls.approve(
        "toolCallId",
        workspace_id: "workspaceId",
        objective_id: "objectiveId"
      )

    assert_pattern do
      response => Cadenya::Objectives::ObjectiveToolCall
    end

    assert_pattern do
      response => {
        data: Cadenya::Objectives::ObjectiveToolCallData,
        execution_status: Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::Objectives::ObjectiveToolCall::Status,
        info: Cadenya::Objectives::ObjectiveToolCallInfo | nil
      }
    end
  end

  def test_deny_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.tool_calls.deny(
        "toolCallId",
        workspace_id: "workspaceId",
        objective_id: "objectiveId"
      )

    assert_pattern do
      response => Cadenya::Objectives::ObjectiveToolCall
    end

    assert_pattern do
      response => {
        data: Cadenya::Objectives::ObjectiveToolCallData,
        execution_status: Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::Objectives::ObjectiveToolCall::Status,
        info: Cadenya::Objectives::ObjectiveToolCallInfo | nil
      }
    end
  end

  def test_set_content_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.tool_calls.set_content(
        "toolCallId",
        workspace_id: "workspaceId",
        objective_id: "objectiveId",
        content: [{}]
      )

    assert_pattern do
      response => Cadenya::Objectives::ObjectiveToolCall
    end

    assert_pattern do
      response => {
        data: Cadenya::Objectives::ObjectiveToolCallData,
        execution_status: Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::Objectives::ObjectiveToolCall::Status,
        info: Cadenya::Objectives::ObjectiveToolCallInfo | nil
      }
    end
  end
end
