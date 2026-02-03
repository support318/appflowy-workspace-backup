# AppFlowy Fresh Install Guide

## Backup Complete ✓
Backup saved to: https://github.com/support318/appflowy-workspace-backup

## Fresh Install Steps

### Option 1: Through AppFlowy UI (Recommended)

1. **Access AppFlowy**
   - Go to: https://notes.candidstudios.net
   - Login as: support@candidstudios.net

2. **Delete Current Workspace**
   - Click on workspace settings (gear icon)
   - Select "Delete Workspace" or "Leave Workspace"
   - Confirm deletion

3. **Create New Workspace**
   - Click "Create New Workspace"
   - Name it: "Candid Studios Notes" (or your preferred name)
   - Click Create

4. **Create Initial Views**
   - Create views for your needs (General, Projects, etc.)
   - Test that sidebar shows views correctly

5. **Verify Working State**
   - Refresh browser
   - Confirm sidebar shows all created views
   - Test creating new pages

### Option 2: Database Cleanup (Advanced)

If UI deletion doesn't work, execute the cleanup script:

```bash
# Connect to Railway database
railway link candid-cloud
railway connect

# Then run:
psql -f /tmp/cleanup_workspace.sql
```

## Setting Up Automated GitHub Backups

### Prerequisites
- GitHub Personal Access Token with repo permissions
- Railway project linked locally

### Backup Script

Create `/Users/ryanmayiras/backup_appflowy.sh`:

```bash
#!/bin/bash
BACKUP_DIR="$HOME/appflowy-backups"
DATE=$(date +%Y%m%d_%H%M%S)
mkdir -p "$BACKUP_DIR"

# Export workspace data
railway connect -c "COPY (SELECT workspace_id, oid, partition_key, encode(blob, 'hex') FROM af_collab) TO STDOUT WITH CSV" > "$BACKUP_DIR/workspace_$DATE.csv"

# Push to GitHub
cd "$BACKUP_DIR"
git add -A
git commit -m "Auto backup $DATE"
git push origin main
```

### Schedule Daily Backups

```bash
# Add to crontab
crontab -e

# Add this line for daily 2am backups:
0 2 * * * /Users/ryanmayiras/backup_appflowy.sh
```

## Verification Checklist

After fresh install, verify:
- [ ] Sidebar shows all created views
- [ ] Can create new pages
- [ ] Can edit existing pages
- [ ] Data persists after refresh
- [ ] GitHub backup script configured
- [ ] Backup script tested manually

## Important Notes

1. **This workspace had 6 lost views** from previous session - they cannot be recovered
2. **2 remaining views** were backed up to GitHub before deletion
3. **GitHub backups** will prevent future data loss
4. **Test the backup script** before relying on it

## Recovery if Needed

If you need to reference old data:
```bash
cd /tmp/appflowy-workspace-backup
cat full_ws_db_hex.txt  # Contains hex dump of old workspace
cat appflowy_workspace_backup.md  # Contains metadata
```
