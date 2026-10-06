#!/bin/bash
# Double-click this file to send the landing pages to GitHub.
# It shows what would go up, asks before adding anything new, then pushes.

cd "$(dirname "$0")" || exit 1
printf '\nVagabond Haven landing pages\n%s\n\n' "$(pwd)"

printf 'Checking GitHub...\n'
if ! git fetch -q origin main; then
  printf '\nCould not reach GitHub (the reason is above). Check the internet connection and try again.\n'
  read -r -p 'Press Enter to close. '; exit 1
fi
printf 'Looking for changes. If this folder is in iCloud and files were offloaded,\n'
printf 'the first run can take a few minutes while they download.\n\n'

changes="$(git status --porcelain)"
if [ -n "$changes" ]; then
  printf 'Not yet committed:\n\n%s\n\n' "$changes"
  printf 'Lines starting with ?? are files git has never seen. Anything in\n'
  printf 'the ignore list is not shown and will not be sent.\n\n'
  read -r -p 'Include all of this? [y/N] ' ok
  case "$ok" in
    y|Y|yes|YES)
      read -r -p 'Short description of the change: ' msg
      [ -z "$msg" ] && msg='Update landing pages'
      git add -A && git commit -q -m "$msg" || { printf '\nCommit failed.\n'; read -r -p 'Press Enter to close. '; exit 1; }
      printf '\nCommitted.\n\n'
      ;;
    *)
      printf '\nLeaving those alone. Only work already committed will be sent.\n\n'
      ;;
  esac
fi

ahead="$(git log --oneline origin/main..HEAD 2>/dev/null)"
if [ -z "$ahead" ]; then
  printf 'Nothing to push. GitHub is already up to date.\n\n'
else
  printf 'Sending:\n\n%s\n\n' "$ahead"
  if git push origin main; then
    printf '\nDone, and this goes live on the site.\n'
    printf 'https://github.com/VagabondHaven/landing-pages\n\n'
  else
    printf '\nPush failed, the reason is above.\n\n'
  fi
fi

read -r -p 'Press Enter to close. '
