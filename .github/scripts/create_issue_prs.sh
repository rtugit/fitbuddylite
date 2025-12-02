#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(pwd)"
ROOT_BRANCH=master    # change to 'main' if needed
GH_REPO="rtugit/fitbuddylite"

# Check for clean working tree
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree is not clean. Commit or stash changes before running this script."
  exit 1
fi

# Ensure gh auth
if ! gh auth status >/dev/null 2>&1; then
  echo "gh CLI not authenticated. Run: gh auth login"
  exit 1
fi

# Array of issue entries: "ID:slug"
ISSUES=(
  "13:hompage-ui"
  "14:workout-plans-index"
  "15:workout-plans-new"
  "16:ai-chat-flow"
  "17:generate-ai-plan"
  "18:workout-plans-show"
  "19:scope0-seed"
  "20:scope1-index-show"
  "21:scope2-new-create"
  "22:scope3-edit-update"
  "23:scope4-adding-ai"
  "24:scope5-system-prompt"
)

echo "Fetching latest $ROOT_BRANCH..."
git fetch origin "$ROOT_BRANCH"
git switch "$ROOT_BRANCH"
git pull origin "$ROOT_BRANCH"

for entry in "${ISSUES[@]}"; do
  ISSUE_ID="${entry%%:*}"
  SLUG="${entry#*:}"

  # normalize slug: replace spaces with dash, lowercase
  NORMALIZED_SLUG="$(echo "$SLUG" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]+/-/g' | sed 's/^-//' | sed 's/-$//')"
  BRANCH_NAME="feature/${ISSUE_ID}-${NORMALIZED_SLUG}"

  echo
  echo "=== Processing Issue #${ISSUE_ID}: ${SLUG} -> branch ${BRANCH_NAME} ==="

  # Create branch from latest root branch
  git switch -c "$BRANCH_NAME"

  # Push branch to origin
  git push --set-upstream origin "$BRANCH_NAME"

  # Create PR linking to issue
  PR_TITLE="Issue #${ISSUE_ID} — ${SLUG//-/ }"
  PR_BODY="Closes #${ISSUE_ID}

Please implement the changes described in issue #${ISSUE_ID}.

(Automated PR created by script.)"

  # Create PR (non-interactive). If PR already exists, skip.
  existing_pr=$(gh pr list --repo "$GH_REPO" --head "$BRANCH_NAME" --state open --json number --jq '.[0].number' 2>/dev/null || true)
  if [[ -n "$existing_pr" && "$existing_pr" != "null" ]]; then
    echo "PR already exists for ${BRANCH_NAME}: #${existing_pr}, skipping creation."
  else
    gh pr create --repo "$GH_REPO" --head "$BRANCH_NAME" --base "$ROOT_BRANCH" \
      --title "$PR_TITLE" --body "$PR_BODY" --web=false
    echo "Created PR for ${BRANCH_NAME}"
  fi

  # switch back to root branch before next iteration
  git switch "$ROOT_BRANCH"
done

echo
echo "Done. Created branches and opened PRs for listed issues."
