# AppFlowy Workspace Backup

## Backup Date
February 3, 2025

## Workspace Details
- **Workspace ID**: 5efbf500-a983-43fd-aa46-0e400198820a
- **Owner UID**: 1769929383010 (support@candidstudios.net)
- **URL**: notes.candidstudios.net

## Data State Before Fresh Install
- **Original View Count**: 8
- **Current View Count**: 2 (6 views lost in previous session)
- **Views Remaining**:
  - 126a75f1-dd34-42c6-98d6-f4e306ac6774 (5635 bytes)
  - c9a8982b-f2b8-4518-8700-c816b24bac5b (609 bytes)

## Lost Views (from previous session)
- 0b7b4345-323c-4e6f-896e-9ed6bfe60ca6
- 58b1402d-d9d4-4403-b01e-73c574b4ab1b (General)
- 64832398-6042-4336-8df8-d7b6e9084b34
- 86bee3fc-f42a-402e-b36e-8e65bd2e1291
- b288de67-d13b-4a9d-93d0-b7260d0f117e
- 09098ed4-799f-49cf-b756-b37f7440fba2

## Database Structure (5 partitions)
- Partition 0 (Views): 2 rows
- Partition 1 (Database): 1 row
- Partition 2 (Workspace DB): 1 row
- Partition 3 (Folder): 1 row
- Partition 5 (User Awareness): 1 row

## Issues Encountered
1. Folder blob contained corrupted view ID
2. database_storage_id mismatch in af_workspace table
3. Workspace database referenced non-existent database_id
4. Multiple fixes attempted but sidebar remained blank

## Decision: Fresh Install
Due to persistent issues with sidebar not rendering, proceeding with fresh installation.
