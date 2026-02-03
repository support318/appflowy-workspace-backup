-- Cleanup current workspace for fresh install
-- Workspace ID: 5efbf500-a983-43fd-aa46-0e400198820a

-- Delete from collab members (permissions)
DELETE FROM af_collab_member 
WHERE oid IN (
    SELECT oid FROM af_collab 
    WHERE workspace_id = '5efbf500-a983-43fd-aa46-0e400198820a'::uuid
);

-- Delete all collab data for this workspace
DELETE FROM af_collab 
WHERE workspace_id = '5efbf500-a983-43fd-aa46-0e400198820a'::uuid;

-- Delete workspace metadata
DELETE FROM af_workspace 
WHERE workspace_id = '5efbf500-a983-43fd-aa46-0e400198820a'::uuid;

-- Delete from user awareness
DELETE FROM af_user 
WHERE uid = '1769929383010';

-- Verify deletion
SELECT 'Remaining workspaces:' as status, COUNT(*) as count FROM af_workspace;
SELECT 'Remaining collabs:' as status, COUNT(*) as count FROM af_collab;
