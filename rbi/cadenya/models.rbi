# typed: strong

module Cadenya
  AccountAPI = Cadenya::Models::AccountAPI

  AccountInfo = Cadenya::Models::AccountInfo

  AccountResourceMetadata = Cadenya::Models::AccountResourceMetadata

  AccountRetrieveParams = Cadenya::Models::AccountRetrieveParams

  AccountRotateWebhookSigningKeyParams =
    Cadenya::Models::AccountRotateWebhookSigningKeyParams

  AccountSpec = Cadenya::Models::AccountSpec

  Agent = Cadenya::Models::Agent

  AgentArchiveParams = Cadenya::Models::AgentArchiveParams

  AgentCreateParams = Cadenya::Models::AgentCreateParams

  AgentDeleteParams = Cadenya::Models::AgentDeleteParams

  AgentInfo = Cadenya::Models::AgentInfo

  AgentListParams = Cadenya::Models::AgentListParams

  AgentPublishParams = Cadenya::Models::AgentPublishParams

  AgentRetrieveParams = Cadenya::Models::AgentRetrieveParams

  Agents = Cadenya::Models::Agents

  AgentSpec = Cadenya::Models::AgentSpec

  AgentUnarchiveParams = Cadenya::Models::AgentUnarchiveParams

  AgentUnpublishParams = Cadenya::Models::AgentUnpublishParams

  AgentUpdateParams = Cadenya::Models::AgentUpdateParams

  AIProviderKey = Cadenya::Models::AIProviderKey

  AIProviderKeyCreateParams = Cadenya::Models::AIProviderKeyCreateParams

  AIProviderKeyDeleteParams = Cadenya::Models::AIProviderKeyDeleteParams

  AIProviderKeyListParams = Cadenya::Models::AIProviderKeyListParams

  AIProviderKeyRetrieveParams = Cadenya::Models::AIProviderKeyRetrieveParams

  AIProviderKeySpec = Cadenya::Models::AIProviderKeySpec

  AIProviderKeyUpdateParams = Cadenya::Models::AIProviderKeyUpdateParams

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

  ApprovalRequirementFilter = Cadenya::Models::ApprovalRequirementFilter

  AssistantMessage = Cadenya::Models::AssistantMessage

  AssistantToolCall = Cadenya::Models::AssistantToolCall

  AttributeFilter = Cadenya::Models::AttributeFilter

  BareMetadata = Cadenya::Models::BareMetadata

  CallableTool = Cadenya::Models::CallableTool

  ContextWindowCompacted = Cadenya::Models::ContextWindowCompacted

  CreateOperationMetadata = Cadenya::Models::CreateOperationMetadata

  CreateResourceMetadata = Cadenya::Models::CreateResourceMetadata

  MemoryLayer = Cadenya::Models::MemoryLayer

  MemoryLayerCreateParams = Cadenya::Models::MemoryLayerCreateParams

  MemoryLayerDeleteParams = Cadenya::Models::MemoryLayerDeleteParams

  MemoryLayerInfo = Cadenya::Models::MemoryLayerInfo

  MemoryLayerListParams = Cadenya::Models::MemoryLayerListParams

  MemoryLayerRetrieveParams = Cadenya::Models::MemoryLayerRetrieveParams

  MemoryLayers = Cadenya::Models::MemoryLayers

  MemoryLayerSpec = Cadenya::Models::MemoryLayerSpec

  MemoryLayerUpdateParams = Cadenya::Models::MemoryLayerUpdateParams

  MemoryRead = Cadenya::Models::MemoryRead

  MemoryReference = Cadenya::Models::MemoryReference

  Model = Cadenya::Models::Model

  ModelDisableParams = Cadenya::Models::ModelDisableParams

  ModelEnableParams = Cadenya::Models::ModelEnableParams

  ModelListParams = Cadenya::Models::ModelListParams

  ModelRetrieveParams = Cadenya::Models::ModelRetrieveParams

  ModelSpec = Cadenya::Models::ModelSpec

  ModelSwapParams = Cadenya::Models::ModelSwapParams

  Objective = Cadenya::Models::Objective

  ObjectiveCancelParams = Cadenya::Models::ObjectiveCancelParams

  ObjectiveCompactParams = Cadenya::Models::ObjectiveCompactParams

  ObjectiveConfigSnapshot = Cadenya::Models::ObjectiveConfigSnapshot

  ObjectiveContextWindow = Cadenya::Models::ObjectiveContextWindow

  ObjectiveContextWindowData = Cadenya::Models::ObjectiveContextWindowData

  ObjectiveContinueParams = Cadenya::Models::ObjectiveContinueParams

  ObjectiveCreateParams = Cadenya::Models::ObjectiveCreateParams

  ObjectiveError = Cadenya::Models::ObjectiveError

  ObjectiveEvent = Cadenya::Models::ObjectiveEvent

  ObjectiveEventData = Cadenya::Models::ObjectiveEventData

  ObjectiveEventInfo = Cadenya::Models::ObjectiveEventInfo

  ObjectiveEventWebhookData = Cadenya::Models::ObjectiveEventWebhookData

  ObjectiveInfo = Cadenya::Models::ObjectiveInfo

  ObjectiveListContextWindowsParams =
    Cadenya::Models::ObjectiveListContextWindowsParams

  ObjectiveListEventsParams = Cadenya::Models::ObjectiveListEventsParams

  ObjectiveListParams = Cadenya::Models::ObjectiveListParams

  ObjectiveRetrieveParams = Cadenya::Models::ObjectiveRetrieveParams

  Objectives = Cadenya::Models::Objectives

  ObjectiveSecret = Cadenya::Models::ObjectiveSecret

  ObjectiveStreamEventsParams = Cadenya::Models::ObjectiveStreamEventsParams

  OperationMetadata = Cadenya::Models::OperationMetadata

  Page = Cadenya::Models::Page

  Profile = Cadenya::Models::Profile

  ProfileSpec = Cadenya::Models::ProfileSpec

  ProfileWhoamiParams = Cadenya::Models::ProfileWhoamiParams

  ResourceMetadata = Cadenya::Models::ResourceMetadata

  RotateWebhookSigningKeyResponse =
    Cadenya::Models::RotateWebhookSigningKeyResponse

  SearchSearchToolsOrToolSetsParams =
    Cadenya::Models::SearchSearchToolsOrToolSetsParams

  StringMatcher = Cadenya::Models::StringMatcher

  SubAgentSpawned = Cadenya::Models::SubAgentSpawned

  SubAgentUpdated = Cadenya::Models::SubAgentUpdated

  SyncCompleted = Cadenya::Models::SyncCompleted

  SyncFailed = Cadenya::Models::SyncFailed

  SyncStarted = Cadenya::Models::SyncStarted

  ToolApprovalRequested = Cadenya::Models::ToolApprovalRequested

  ToolApproved = Cadenya::Models::ToolApproved

  ToolCalled = Cadenya::Models::ToolCalled

  ToolDenied = Cadenya::Models::ToolDenied

  ToolError = Cadenya::Models::ToolError

  ToolFilter = Cadenya::Models::ToolFilter

  ToolResult = Cadenya::Models::ToolResult

  ToolSet = Cadenya::Models::ToolSet

  ToolSetAdapter = Cadenya::Models::ToolSetAdapter

  ToolSetAdapterHTTP = Cadenya::Models::ToolSetAdapterHTTP

  ToolSetAdapterMcp = Cadenya::Models::ToolSetAdapterMcp

  ToolSetAdapterOpenAPI = Cadenya::Models::ToolSetAdapterOpenAPI

  ToolSetArchiveParams = Cadenya::Models::ToolSetArchiveParams

  ToolSetCreateParams = Cadenya::Models::ToolSetCreateParams

  ToolSetDeleteParams = Cadenya::Models::ToolSetDeleteParams

  ToolSetEvent = Cadenya::Models::ToolSetEvent

  ToolSetEventData = Cadenya::Models::ToolSetEventData

  ToolSetGetOpenAPISpecParams = Cadenya::Models::ToolSetGetOpenAPISpecParams

  ToolSetInfo = Cadenya::Models::ToolSetInfo

  ToolSetListEventsParams = Cadenya::Models::ToolSetListEventsParams

  ToolSetListParams = Cadenya::Models::ToolSetListParams

  ToolSetRetrieveParams = Cadenya::Models::ToolSetRetrieveParams

  ToolSets = Cadenya::Models::ToolSets

  ToolSetSpec = Cadenya::Models::ToolSetSpec

  ToolSetUnarchiveParams = Cadenya::Models::ToolSetUnarchiveParams

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

  WebhookUnsafeUnwrapParams = Cadenya::Models::WebhookUnsafeUnwrapParams

  WebhookUnwrapParams = Cadenya::Models::WebhookUnwrapParams

  Workspace = Cadenya::Models::Workspace

  WorkspaceAdmin = Cadenya::Models::WorkspaceAdmin

  WorkspaceAdminArchiveParams = Cadenya::Models::WorkspaceAdminArchiveParams

  WorkspaceAdminCreateParams = Cadenya::Models::WorkspaceAdminCreateParams

  WorkspaceAdminListParams = Cadenya::Models::WorkspaceAdminListParams

  WorkspaceAdminRetrieveParams = Cadenya::Models::WorkspaceAdminRetrieveParams

  WorkspaceAdminUpdateParams = Cadenya::Models::WorkspaceAdminUpdateParams

  WorkspaceGetParams = Cadenya::Models::WorkspaceGetParams

  WorkspaceListParams = Cadenya::Models::WorkspaceListParams

  WorkspaceMember = Cadenya::Models::WorkspaceMember

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
