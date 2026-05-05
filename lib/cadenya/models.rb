# frozen_string_literal: true

module Cadenya
  [Cadenya::Internal::Type::BaseModel, *Cadenya::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Cadenya::Internal::AnyHash) } }
  end

  Cadenya::Internal::Util.walk_namespaces(Cadenya::Models).each do |mod|
    case mod
    in Cadenya::Internal::Type::Enum | Cadenya::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Cadenya::Internal::Util.walk_namespaces(Cadenya::Models)
                         .lazy
                         .grep(Cadenya::Internal::Type::Union)
                         .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AccountAPI = Cadenya::Models::AccountAPI

  AccountInfo = Cadenya::Models::AccountInfo

  AccountResourceMetadata = Cadenya::Models::AccountResourceMetadata

  AccountRetrieveParams = Cadenya::Models::AccountRetrieveParams

  AccountRotateWebhookSigningKeyParams = Cadenya::Models::AccountRotateWebhookSigningKeyParams

  AccountSpec = Cadenya::Models::AccountSpec

  Agent = Cadenya::Models::Agent

  AgentCreateParams = Cadenya::Models::AgentCreateParams

  AgentDeleteParams = Cadenya::Models::AgentDeleteParams

  AgentEntry = Cadenya::Models::AgentEntry

  AgentInfo = Cadenya::Models::AgentInfo

  AgentListParams = Cadenya::Models::AgentListParams

  AgentRetrieveParams = Cadenya::Models::AgentRetrieveParams

  Agents = Cadenya::Models::Agents

  AgentScheduleEntry = Cadenya::Models::AgentScheduleEntry

  AgentSpec = Cadenya::Models::AgentSpec

  AgentUpdateParams = Cadenya::Models::AgentUpdateParams

  AgentVariationEntry = Cadenya::Models::AgentVariationEntry

  APIKey = Cadenya::Models::APIKey

  APIKeyCreateParams = Cadenya::Models::APIKeyCreateParams

  APIKeyDeleteParams = Cadenya::Models::APIKeyDeleteParams

  APIKeyInfo = Cadenya::Models::APIKeyInfo

  APIKeyListParams = Cadenya::Models::APIKeyListParams

  APIKeyRetrieveParams = Cadenya::Models::APIKeyRetrieveParams

  APIKeyRotateParams = Cadenya::Models::APIKeyRotateParams

  APIKeys = Cadenya::Models::APIKeys

  APIKeySpec = Cadenya::Models::APIKeySpec

  APIKeyUpdateParams = Cadenya::Models::APIKeyUpdateParams

  AssistantMessage = Cadenya::Models::AssistantMessage

  AssistantToolCall = Cadenya::Models::AssistantToolCall

  BareMetadata = Cadenya::Models::BareMetadata

  BulkWorkspaceApply = Cadenya::Models::BulkWorkspaceApply

  BulkWorkspaceApplyData = Cadenya::Models::BulkWorkspaceApplyData

  BulkWorkspaceApplyInfo = Cadenya::Models::BulkWorkspaceApplyInfo

  BulkWorkspaceApplyStatus = Cadenya::Models::BulkWorkspaceApplyStatus

  BulkWorkspaceResourceApplyParams = Cadenya::Models::BulkWorkspaceResourceApplyParams

  BulkWorkspaceResourceListParams = Cadenya::Models::BulkWorkspaceResourceListParams

  BulkWorkspaceResourceRetrieveParams = Cadenya::Models::BulkWorkspaceResourceRetrieveParams

  BulkWorkspaceResources = Cadenya::Models::BulkWorkspaceResources

  CallableTool = Cadenya::Models::CallableTool

  ContextWindowCompacted = Cadenya::Models::ContextWindowCompacted

  CreateOperationMetadata = Cadenya::Models::CreateOperationMetadata

  CreateResourceMetadata = Cadenya::Models::CreateResourceMetadata

  McpToolFilter = Cadenya::Models::McpToolFilter

  MemoryEntryItem = Cadenya::Models::MemoryEntryItem

  MemoryLayer = Cadenya::Models::MemoryLayer

  MemoryLayerCreateParams = Cadenya::Models::MemoryLayerCreateParams

  MemoryLayerDeleteParams = Cadenya::Models::MemoryLayerDeleteParams

  MemoryLayerEntry = Cadenya::Models::MemoryLayerEntry

  MemoryLayerInfo = Cadenya::Models::MemoryLayerInfo

  MemoryLayerListParams = Cadenya::Models::MemoryLayerListParams

  MemoryLayerRetrieveParams = Cadenya::Models::MemoryLayerRetrieveParams

  MemoryLayers = Cadenya::Models::MemoryLayers

  MemoryLayerSpec = Cadenya::Models::MemoryLayerSpec

  MemoryLayerUpdateParams = Cadenya::Models::MemoryLayerUpdateParams

  MemoryRead = Cadenya::Models::MemoryRead

  MemoryReference = Cadenya::Models::MemoryReference

  Model = Cadenya::Models::Model

  ModelListParams = Cadenya::Models::ModelListParams

  ModelRetrieveParams = Cadenya::Models::ModelRetrieveParams

  ModelSetStatusParams = Cadenya::Models::ModelSetStatusParams

  ModelSpec = Cadenya::Models::ModelSpec

  Objective = Cadenya::Models::Objective

  ObjectiveCancelParams = Cadenya::Models::ObjectiveCancelParams

  ObjectiveCompactParams = Cadenya::Models::ObjectiveCompactParams

  ObjectiveContextWindow = Cadenya::Models::ObjectiveContextWindow

  ObjectiveContextWindowData = Cadenya::Models::ObjectiveContextWindowData

  ObjectiveContinueParams = Cadenya::Models::ObjectiveContinueParams

  ObjectiveCreateParams = Cadenya::Models::ObjectiveCreateParams

  ObjectiveData = Cadenya::Models::ObjectiveData

  ObjectiveDataSecret = Cadenya::Models::ObjectiveDataSecret

  ObjectiveError = Cadenya::Models::ObjectiveError

  ObjectiveEventData = Cadenya::Models::ObjectiveEventData

  ObjectiveEventInfo = Cadenya::Models::ObjectiveEventInfo

  ObjectiveEventWebhookData = Cadenya::Models::ObjectiveEventWebhookData

  ObjectiveInfo = Cadenya::Models::ObjectiveInfo

  ObjectiveListContextWindowsParams = Cadenya::Models::ObjectiveListContextWindowsParams

  ObjectiveListEventsParams = Cadenya::Models::ObjectiveListEventsParams

  ObjectiveListParams = Cadenya::Models::ObjectiveListParams

  ObjectiveRetrieveParams = Cadenya::Models::ObjectiveRetrieveParams

  Objectives = Cadenya::Models::Objectives

  ObjectiveStatus = Cadenya::Models::ObjectiveStatus

  OperationMetadata = Cadenya::Models::OperationMetadata

  Page = Cadenya::Models::Page

  Profile = Cadenya::Models::Profile

  ProfileSpec = Cadenya::Models::ProfileSpec

  ResourceMetadata = Cadenya::Models::ResourceMetadata

  RotateWebhookSigningKeyResponse = Cadenya::Models::RotateWebhookSigningKeyResponse

  SearchSearchToolsOrToolSetsParams = Cadenya::Models::SearchSearchToolsOrToolSetsParams

  SubObjectiveCreated = Cadenya::Models::SubObjectiveCreated

  SyncCompleted = Cadenya::Models::SyncCompleted

  SyncFailed = Cadenya::Models::SyncFailed

  SyncStarted = Cadenya::Models::SyncStarted

  ToolApprovalRequested = Cadenya::Models::ToolApprovalRequested

  ToolApproved = Cadenya::Models::ToolApproved

  ToolCalled = Cadenya::Models::ToolCalled

  ToolDenied = Cadenya::Models::ToolDenied

  ToolEntry = Cadenya::Models::ToolEntry

  ToolError = Cadenya::Models::ToolError

  ToolResult = Cadenya::Models::ToolResult

  ToolSet = Cadenya::Models::ToolSet

  ToolSetAdapter = Cadenya::Models::ToolSetAdapter

  ToolSetAdapterHTTP = Cadenya::Models::ToolSetAdapterHTTP

  ToolSetAdapterMcp = Cadenya::Models::ToolSetAdapterMcp

  ToolSetCreateParams = Cadenya::Models::ToolSetCreateParams

  ToolSetDeleteParams = Cadenya::Models::ToolSetDeleteParams

  ToolSetEntry = Cadenya::Models::ToolSetEntry

  ToolSetEvent = Cadenya::Models::ToolSetEvent

  ToolSetEventData = Cadenya::Models::ToolSetEventData

  ToolSetInfo = Cadenya::Models::ToolSetInfo

  ToolSetListEventsParams = Cadenya::Models::ToolSetListEventsParams

  ToolSetListParams = Cadenya::Models::ToolSetListParams

  ToolSetRetrieveParams = Cadenya::Models::ToolSetRetrieveParams

  ToolSets = Cadenya::Models::ToolSets

  ToolSetSpec = Cadenya::Models::ToolSetSpec

  ToolSetUpdateParams = Cadenya::Models::ToolSetUpdateParams

  UnsafeUnwrapWebhookEvent = Cadenya::Models::UnsafeUnwrapWebhookEvent

  UnwrapWebhookEvent = Cadenya::Models::UnwrapWebhookEvent

  UpdateResourceMetadata = Cadenya::Models::UpdateResourceMetadata

  Upload = Cadenya::Models::Upload

  UploadCreateParams = Cadenya::Models::UploadCreateParams

  UploadInfo = Cadenya::Models::UploadInfo

  UploadRetrieveParams = Cadenya::Models::UploadRetrieveParams

  UploadSpec = Cadenya::Models::UploadSpec

  UserMessage = Cadenya::Models::UserMessage

  VariationAssignmentEntry = Cadenya::Models::VariationAssignmentEntry

  VariationMemoryLayerEntry = Cadenya::Models::VariationMemoryLayerEntry

  WebhookUnsafeUnwrapParams = Cadenya::Models::WebhookUnsafeUnwrapParams

  WebhookUnwrapParams = Cadenya::Models::WebhookUnwrapParams

  Workspace = Cadenya::Models::Workspace

  WorkspaceGetParams = Cadenya::Models::WorkspaceGetParams

  WorkspaceListParams = Cadenya::Models::WorkspaceListParams

  WorkspaceSecret = Cadenya::Models::WorkspaceSecret

  WorkspaceSecretCreateParams = Cadenya::Models::WorkspaceSecretCreateParams

  WorkspaceSecretDeleteParams = Cadenya::Models::WorkspaceSecretDeleteParams

  WorkspaceSecretInfo = Cadenya::Models::WorkspaceSecretInfo

  WorkspaceSecretListParams = Cadenya::Models::WorkspaceSecretListParams

  WorkspaceSecretRetrieveParams = Cadenya::Models::WorkspaceSecretRetrieveParams

  WorkspaceSecretSpec = Cadenya::Models::WorkspaceSecretSpec

  WorkspaceSecretUpdateParams = Cadenya::Models::WorkspaceSecretUpdateParams

  WorkspaceSpec = Cadenya::Models::WorkspaceSpec
end
