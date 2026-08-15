# Cadenya Ruby SDK reference

Keyword arguments are snake_case (nested request hashes too, symbols or strings); see README.md for usage patterns.

## client.accounts

Retrieves the current account for the token accessing the API

```ruby
client.accounts.retrieve() # => Cadenya::Types::Account
```
Rotates the challenge token for the account

```ruby
client.accounts.rotate_challenge_token() # => Cadenya::Types::RotateChallengeTokenResponse
```
Rotates the webhook signing key for the account

```ruby
client.accounts.rotate_webhook_signing_key() # => Cadenya::Types::RotateWebhookEventsHmacSecretResponse
```

## client.api_keys

Get the global API key

```ruby
client.api_keys.retrieve_global() # => Cadenya::Types::APIKey
```
Disable the global API key

```ruby
client.api_keys.disable_global() # => Cadenya::Types::APIKey
```
Enable the global API key

```ruby
client.api_keys.enable_global() # => Cadenya::Types::APIKey
```
Rotate the global API key

```ruby
client.api_keys.rotate_global() # => Cadenya::Types::APIKey
```
List API keys

```ruby
client.api_keys.list(workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::APIKey
```
Create a new API key

```ruby
client.api_keys.create(metadata:, spec:, workspace_id: nil) # => Cadenya::Types::APIKey
```
Get an API key by ID

```ruby
client.api_keys.retrieve(id, workspace_id: nil) # => Cadenya::Types::APIKey
```
Delete an API key

```ruby
client.api_keys.delete(id, workspace_id: nil) # => nil
```
Update an API key

```ruby
client.api_keys.update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::APIKey
```
Disable an API key

```ruby
client.api_keys.disable(id, workspace_id: nil) # => Cadenya::Types::APIKey
```
Enable an API key

```ruby
client.api_keys.enable(id, workspace_id: nil) # => Cadenya::Types::APIKey
```
Rotate an API key

```ruby
client.api_keys.rotate(id, workspace_id: nil) # => Cadenya::Types::APIKey
```

## client.workspace_admin

Search account profiles

```ruby
client.workspace_admin.list_profiles(limit: nil, cursor: nil, query: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::Profile
```
List all workspaces in the account

```ruby
client.workspace_admin.list_account(limit: nil, cursor: nil, include_archived: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::Workspace
```
Create a workspace

```ruby
client.workspace_admin.create(metadata:, spec:) # => Cadenya::Types::Workspace
```
Get a workspace by ID

```ruby
client.workspace_admin.retrieve(workspace_id: nil) # => Cadenya::Types::Workspace
```
Archive a workspace

```ruby
client.workspace_admin.archive(workspace_id: nil) # => nil
```
Update a workspace

```ruby
client.workspace_admin.update(workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::Workspace
```
List workspace members

```ruby
client.workspace_admin.list_members(workspace_id: nil, limit: nil, cursor: nil) # => Cadenya::Page of Cadenya::Types::WorkspaceMember
```
Add a member to a workspace

```ruby
client.workspace_admin.add_member(workspace_id: nil, profile_id: nil, email: nil) # => Cadenya::Types::WorkspaceMember
```
Remove a member from a workspace

```ruby
client.workspace_admin.remove_member(profile_id, workspace_id: nil) # => nil
```

## client.profiles

Retrieves the profile for the credentials accessing the API

```ruby
client.profiles.whoami() # => Cadenya::Types::Profile
```

## client.workspaces

List workspaces

```ruby
client.workspaces.list(limit: nil, cursor: nil, sort_order: nil, include_info: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::Workspace
```

## client.agents

List agents

```ruby
client.agents.list(workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, state: nil, variation_selection_mode: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::Agent
```
Create a new agent

```ruby
client.agents.create(metadata:, spec:, workspace_id: nil, default_variation: nil) # => Cadenya::Types::Agent
```
List feedback for an agent

```ruby
client.agents.list_feedback(agent_id, workspace_id: nil, limit: nil, cursor: nil, query: nil, sentiment: nil, agent_variation_id: nil, created_after: nil, created_before: nil, labels: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::ObjectiveFeedback
```
List webhook deliveries

```ruby
client.agents.list_webhook_deliveries(agent_id, workspace_id: nil, cursor: nil, limit: nil, objective_id: nil, event_type: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::WebhookDelivery
```
Get an agent by ID

```ruby
client.agents.retrieve(id, workspace_id: nil) # => Cadenya::Types::Agent
```
Delete an agent

```ruby
client.agents.delete(id, workspace_id: nil) # => nil
```
Update an agent

```ruby
client.agents.update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::Agent
```
Archive an agent

```ruby
client.agents.archive(id, workspace_id: nil) # => Cadenya::Types::Agent
```
Publish an agent

```ruby
client.agents.publish(id, workspace_id: nil) # => Cadenya::Types::Agent
```
Unarchive an agent

```ruby
client.agents.unarchive(id, workspace_id: nil) # => Cadenya::Types::Agent
```
Unpublish an agent

```ruby
client.agents.unpublish(id, workspace_id: nil) # => Cadenya::Types::Agent
```

## client.agents.schedules

List schedules

```ruby
client.agents.schedules.list(agent_id, workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::AgentSchedule
```
Create a new schedule

```ruby
client.agents.schedules.create(agent_id, metadata:, spec:, workspace_id: nil) # => Cadenya::Types::AgentSchedule
```
Get a schedule by ID

```ruby
client.agents.schedules.retrieve(agent_id, id, workspace_id: nil) # => Cadenya::Types::AgentSchedule
```
Delete a schedule

```ruby
client.agents.schedules.delete(agent_id, id, workspace_id: nil) # => nil
```
Update a schedule

```ruby
client.agents.schedules.update(agent_id, id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::AgentSchedule
```
Archive a schedule

```ruby
client.agents.schedules.archive(agent_id, id, workspace_id: nil) # => Cadenya::Types::AgentSchedule
```
Pause a schedule

```ruby
client.agents.schedules.pause(agent_id, id, workspace_id: nil) # => Cadenya::Types::AgentSchedule
```
Resume a schedule

```ruby
client.agents.schedules.resume(agent_id, id, workspace_id: nil) # => Cadenya::Types::AgentSchedule
```

## client.agents.variations

List variations

```ruby
client.agents.variations.list(agent_id, workspace_id: nil, limit: nil, cursor: nil, sort_order: nil, include_info: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::AgentVariation
```
Create a new variation

```ruby
client.agents.variations.create(agent_id, metadata:, spec:, workspace_id: nil) # => Cadenya::Types::AgentVariation
```
Get a variation by ID

```ruby
client.agents.variations.retrieve(agent_id, id, workspace_id: nil) # => Cadenya::Types::AgentVariation
```
Delete a variation

```ruby
client.agents.variations.delete(agent_id, id, workspace_id: nil) # => nil
```
Update a variation

```ruby
client.agents.variations.update(agent_id, id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::AgentVariation
```
Add an assignment to a variation

```ruby
client.agents.variations.add_assignment(agent_id, variation_id, body:, workspace_id: nil) # => Cadenya::Types::VariationAssignment
```
Remove an assignment from a variation

```ruby
client.agents.variations.remove_assignment(agent_id, variation_id, id, workspace_id: nil) # => nil
```
Attach a memory layer to a variation

```ruby
client.agents.variations.add_memory_layer(agent_id, variation_id, memory_layer_id:, workspace_id: nil, position: nil) # => Cadenya::Types::VariationMemoryLayerAssignment
```
Remove a memory layer assignment from a variation

```ruby
client.agents.variations.remove_memory_layer(agent_id, variation_id, id, workspace_id: nil) # => nil
```
Update a variation's memory layer assignment

```ruby
client.agents.variations.update_memory_layer(agent_id, variation_id, id, workspace_id: nil, position: nil) # => Cadenya::Types::VariationMemoryLayerAssignment
```

## client.ai_provider_keys

List AI provider keys

```ruby
client.ai_provider_keys.list(workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, promotional: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::AIProviderKey
```
Create a new AI provider key

```ruby
client.ai_provider_keys.create(metadata:, spec:, workspace_id: nil) # => Cadenya::Types::AIProviderKey
```
Get an AI provider key by ID

```ruby
client.ai_provider_keys.retrieve(id, workspace_id: nil) # => Cadenya::Types::AIProviderKey
```
Delete an AI provider key

```ruby
client.ai_provider_keys.delete(id, workspace_id: nil) # => nil
```
Update an AI provider key

```ruby
client.ai_provider_keys.update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::AIProviderKey
```

## client.memory_layers

List memory layers

```ruby
client.memory_layers.list(workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, type: nil, agent_id: nil, episodic_key_prefix: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::MemoryLayer
```
Create a new memory layer

```ruby
client.memory_layers.create(metadata:, spec:, workspace_id: nil) # => Cadenya::Types::MemoryLayer
```
Get a memory layer by ID

```ruby
client.memory_layers.retrieve(id, workspace_id: nil) # => Cadenya::Types::MemoryLayer
```
Delete a memory layer

```ruby
client.memory_layers.delete(id, workspace_id: nil) # => nil
```
Update a memory layer

```ruby
client.memory_layers.update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::MemoryLayer
```

## client.memory_layers.entries

List memory entries

```ruby
client.memory_layers.entries.list(memory_layer_id, workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::MemoryEntry
```
Create a new memory entry

```ruby
client.memory_layers.entries.create(memory_layer_id, metadata:, spec:, workspace_id: nil) # => Cadenya::Types::MemoryEntryDetail
```
Get a memory entry by ID

```ruby
client.memory_layers.entries.retrieve(memory_layer_id, id, workspace_id: nil) # => Cadenya::Types::MemoryEntryDetail
```
Delete a memory entry

```ruby
client.memory_layers.entries.delete(memory_layer_id, id, workspace_id: nil) # => nil
```
Update a memory entry

```ruby
client.memory_layers.entries.update(memory_layer_id, id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::MemoryEntryDetail
```

## client.models

List models

```ruby
client.models.list(workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, state: nil, ai_provider_key_id: nil, is_assigned: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::Model
```
Get a model by ID

```ruby
client.models.retrieve(id, workspace_id: nil) # => Cadenya::Types::Model
```
Disable a model

```ruby
client.models.disable(id, workspace_id: nil) # => Cadenya::Types::Model
```
Enable a model

```ruby
client.models.enable(id, workspace_id: nil) # => Cadenya::Types::Model
```
Swap models on agent variations

```ruby
client.models.swap_on_variations(workspace_id: nil, model_swaps: nil) # => nil
```

## client.objectives

List objectives

```ruby
client.objectives.list(workspace_id: nil, limit: nil, cursor: nil, agent_id: nil, parent_objective_id: nil, state: nil, profile_id: nil, sort_order: nil, include_info: nil, agent_schedule_id: nil, labels: nil, tenant_id: nil, subject_id: nil, widget_id: nil, widget_session_id: nil) # => Cadenya::Page of Cadenya::Types::Objective
```
Create a new objective

```ruby
client.objectives.create(agent_id:, system_prompt_data:, workspace_id: nil, variation_id: nil, metadata: nil, first_user_message: nil, secrets: nil, memory_cascade: nil, first_user_message_data: nil, episodic_memory: nil, tenant: nil, subject: nil, pinned_parameters: nil) # => Cadenya::Types::Objective
```
Get an objective by ID

```ruby
client.objectives.retrieve(id, workspace_id: nil) # => Cadenya::Types::Objective
```
List objective context windows

```ruby
client.objectives.list_context_windows(objective_id, workspace_id: nil, limit: nil, cursor: nil, include_info: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::ObjectiveContextWindow
```
Get objective context diagnostics

```ruby
client.objectives.retrieve_diagnostics(objective_id, workspace_id: nil) # => Cadenya::Types::GetObjectiveDiagnosticsResponse
```
List objective events

```ruby
client.objectives.list_events(objective_id, workspace_id: nil, limit: nil, cursor: nil, sort_order: nil, include_info: nil, window_id: nil, since_event_id: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::ObjectiveEvent
```
Stream objective events

```ruby
client.objectives.stream_events(objective_id, workspace_id: nil, last_event_id: nil) # => Cadenya::Stream
```
List feedback for an objective

```ruby
client.objectives.list_feedback(objective_id, workspace_id: nil, limit: nil, cursor: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::ObjectiveFeedback
```
Submit feedback for an objective

```ruby
client.objectives.create_feedback(objective_id, metadata:, data:, workspace_id: nil) # => Cadenya::Types::ObjectiveFeedback
```
List objective tasks

```ruby
client.objectives.list_tasks(objective_id, workspace_id: nil, limit: nil, cursor: nil, sort_order: nil) # => Cadenya::Page of Cadenya::Types::ObjectiveTask
```
Get an objective task by ID

```ruby
client.objectives.retrieve_task(objective_id, id, workspace_id: nil) # => Cadenya::Types::ObjectiveTask
```
List objective tool calls

```ruby
client.objectives.list_tool_calls(objective_id, workspace_id: nil, limit: nil, cursor: nil, status: nil, include_info: nil, execution_status: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::ObjectiveToolCall
```
Get an objective tool call by ID

```ruby
client.objectives.retrieve_tool_call(objective_id, tool_call_id, workspace_id: nil) # => Cadenya::Types::ObjectiveToolCallWithResult
```
Approve a tool call

```ruby
client.objectives.approve_tool_call(objective_id, tool_call_id, workspace_id: nil) # => Cadenya::Types::ObjectiveToolCall
```
Deny a tool call

```ruby
client.objectives.deny_tool_call(objective_id, tool_call_id, workspace_id: nil, memo: nil) # => Cadenya::Types::ObjectiveToolCall
```
Set a bare tool call's content

```ruby
client.objectives.set_tool_call_content(objective_id, tool_call_id, content:, workspace_id: nil) # => Cadenya::Types::ObjectiveToolCall
```
List objective tools

```ruby
client.objectives.list_tools(objective_id, workspace_id: nil, limit: nil, cursor: nil) # => Cadenya::Page of Cadenya::Types::ObjectiveTool
```
Cancel an objective

```ruby
client.objectives.cancel(objective_id, workspace_id: nil, reason: nil) # => Cadenya::Types::Objective
```
Compact an objective

```ruby
client.objectives.compact(objective_id, workspace_id: nil, compaction_config: nil) # => Cadenya::Types::CompactObjectiveResponse
```
Continue an objective

```ruby
client.objectives.continue(objective_id, message:, workspace_id: nil, enqueue: nil) # => Cadenya::Types::ObjectiveEvent
```

## client.tool_search

Search for tools or tool sets

```ruby
client.tool_search.search_or_sets(query:, workspace_id: nil) # => Cadenya::Types::SearchToolsOrToolSetsResponse
```

## client.tenants

List tenants

```ruby
client.tenants.list(workspace_id: nil, limit: nil, cursor: nil, query: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::Tenant
```
Get a tenant by ID

```ruby
client.tenants.retrieve(id, workspace_id: nil, include_info: nil) # => Cadenya::Types::Tenant
```
Erase a tenant

```ruby
client.tenants.delete(id, workspace_id: nil) # => Cadenya::Types::Tenant
```
List a tenant's subjects

```ruby
client.tenants.list_subjects(tenant_id, workspace_id: nil, limit: nil, cursor: nil, query: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::Subject
```

## client.tool_sets

List tool sets

```ruby
client.tool_sets.list(workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, state: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::ToolSet
```
Create a new tool set

```ruby
client.tool_sets.create(metadata:, spec:, workspace_id: nil) # => Cadenya::Types::ToolSet
```
Get a tool set by ID

```ruby
client.tool_sets.retrieve(id, workspace_id: nil) # => Cadenya::Types::ToolSet
```
Delete a tool set

```ruby
client.tool_sets.delete(id, workspace_id: nil) # => nil
```
Update a tool set

```ruby
client.tool_sets.update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::ToolSet
```
Archive a tool set

```ruby
client.tool_sets.archive(id, workspace_id: nil) # => Cadenya::Types::ToolSet
```
Unarchive a tool set

```ruby
client.tool_sets.unarchive(id, workspace_id: nil) # => Cadenya::Types::ToolSet
```
List tool set events

```ruby
client.tool_sets.list_events(tool_set_id, workspace_id: nil, limit: nil, cursor: nil, sort_order: nil, include_info: nil, labels: nil) # => Cadenya::Page of Cadenya::Types::ToolSetEvent
```
Get consumed OpenAPI spec

```ruby
client.tool_sets.retrieve_open_api_spec(tool_set_id, workspace_id: nil) # => Cadenya::Types::GetToolSetOpenAPISpecResponse
```
List tool set usage

```ruby
client.tool_sets.list_usage(tool_set_id, workspace_id: nil, tool_id: nil, limit: nil, cursor: nil, sort_order: nil) # => Cadenya::Page of Cadenya::Types::ToolSetUsage
```

## client.tool_sets.secrets

List tool set secrets

```ruby
client.tool_sets.secrets.list(tool_set_id, workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::ToolSetSecret
```
Create a new tool set secret

```ruby
client.tool_sets.secrets.create(tool_set_id, metadata:, spec:, workspace_id: nil) # => Cadenya::Types::ToolSetSecret
```
Get a tool set secret by ID

```ruby
client.tool_sets.secrets.retrieve(tool_set_id, id, workspace_id: nil) # => Cadenya::Types::ToolSetSecret
```
Delete a tool set secret

```ruby
client.tool_sets.secrets.delete(tool_set_id, id, workspace_id: nil) # => nil
```
Update a tool set secret

```ruby
client.tool_sets.secrets.update(tool_set_id, id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::ToolSetSecret
```

## client.tool_sets.tools

List tools

```ruby
client.tool_sets.tools.list(tool_set_id, workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, names: nil, states: nil, requires_approval: nil, overlays: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::Tool
```
Create a new tool

```ruby
client.tool_sets.tools.create(tool_set_id, metadata:, spec:, workspace_id: nil) # => Cadenya::Types::Tool
```
Get a tool by ID

```ruby
client.tool_sets.tools.retrieve(tool_set_id, id, workspace_id: nil) # => Cadenya::Types::Tool
```
Delete a tool

```ruby
client.tool_sets.tools.delete(tool_set_id, id, workspace_id: nil) # => nil
```
Update a tool

```ruby
client.tool_sets.tools.update(tool_set_id, id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::Tool
```
Omit a tool

```ruby
client.tool_sets.tools.omit(tool_set_id, id, workspace_id: nil) # => Cadenya::Types::Tool
```
Restore a tool

```ruby
client.tool_sets.tools.restore(tool_set_id, id, workspace_id: nil) # => Cadenya::Types::Tool
```

## client.uploads

Create an upload

```ruby
client.uploads.create(metadata:, spec:, workspace_id: nil) # => Cadenya::Types::Upload
```
Get an upload by ID

```ruby
client.uploads.retrieve(id, workspace_id: nil) # => Cadenya::Types::Upload
```

## client.widget_sessions

List widget sessions

```ruby
client.widget_sessions.list(workspace_id: nil, limit: nil, cursor: nil, widget_id: nil, tenant_id: nil, subject_id: nil, state: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::WidgetSession
```
Create a widget session

```ruby
client.widget_sessions.create(spec:, workspace_id: nil, metadata: nil, secrets: nil) # => Cadenya::Types::WidgetSession
```
Delete all of a tenant's widget sessions

```ruby
client.widget_sessions.delete_tenant(workspace_id: nil, tenant_id: nil) # => Cadenya::Types::DeleteTenantWidgetSessionsResponse
```
Get a widget session by ID

```ruby
client.widget_sessions.retrieve(id, workspace_id: nil) # => Cadenya::Types::WidgetSession
```
Delete a widget session

```ruby
client.widget_sessions.delete(id, workspace_id: nil) # => nil
```
Revoke a widget session

```ruby
client.widget_sessions.revoke(id, workspace_id: nil) # => Cadenya::Types::WidgetSession
```

## client.widgets

List widgets

```ruby
client.widgets.list(workspace_id: nil, limit: nil, cursor: nil, agent_id: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::Widget
```
Create a new widget

```ruby
client.widgets.create(metadata:, spec:, workspace_id: nil) # => Cadenya::Types::Widget
```
Get a widget by ID

```ruby
client.widgets.retrieve(id, workspace_id: nil) # => Cadenya::Types::Widget
```
Delete a widget

```ruby
client.widgets.delete(id, workspace_id: nil) # => nil
```
Update a widget

```ruby
client.widgets.update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::Widget
```
Archive a widget

```ruby
client.widgets.archive(id, workspace_id: nil) # => Cadenya::Types::Widget
```
Unarchive a widget

```ruby
client.widgets.unarchive(id, workspace_id: nil) # => Cadenya::Types::Widget
```

## client.workspace_secrets

List workspace secrets

```ruby
client.workspace_secrets.list(workspace_id: nil, limit: nil, cursor: nil, prefix: nil, query: nil, labels: nil, sort_order: nil, include_info: nil) # => Cadenya::Page of Cadenya::Types::WorkspaceSecret
```
Create a new workspace secret

```ruby
client.workspace_secrets.create(metadata:, spec:, workspace_id: nil) # => Cadenya::Types::WorkspaceSecret
```
Get a workspace secret by ID

```ruby
client.workspace_secrets.retrieve(id, workspace_id: nil) # => Cadenya::Types::WorkspaceSecret
```
Delete a workspace secret

```ruby
client.workspace_secrets.delete(id, workspace_id: nil) # => nil
```
Update a workspace secret

```ruby
client.workspace_secrets.update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil) # => Cadenya::Types::WorkspaceSecret
```
