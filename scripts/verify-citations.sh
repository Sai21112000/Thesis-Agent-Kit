#!/bin/bash
# verify-citations.sh — CLI Citation Verification (Steps 1-2)
# Usage: bash scripts/verify-citations.sh "10.3390/rs15040112"

DOI=$1
if [ -z "$DOI" ]; then
  echo "Usage: bash verify-citations.sh <DOI>"
  exit 1
fi

echo "STEP 1 — DOI Resolution"
HTTP=$(curl -o /dev/null -sI -w "%{http_code}" "https://doi.org/$DOI")
if [ "$HTTP" -eq "301" ] || [ "$HTTP" -eq "302" ]; then
  echo "PASS — DOI resolves"
  curl -sI "https://doi.org/$DOI" | grep -i "location:"
else
  echo "FAIL — HTTP $HTTP — DOI may be fabricated"
fi

echo ""
echo "STEP 2 — CrossRef Metadata"
curl -s "https://api.crossref.org/works/$DOI" | python3 -c "
import json,sys
try:
  d=json.load(sys.stdin)['message']
  print('PASS — CrossRef found')
  print('Title:', d.get('title',['NOT FOUND'])[0])
  print('Authors:', [a.get('family','?') for a in d.get('author',[])])
  print('Journal:', (d.get('container-title') or ['N/A'])[0])
  print('Year:', (d.get('published') or {}).get('date-parts',[[None]])[0][0])
except: print('FAIL — CrossRef lookup failed')
"
echo ""
echo "Run /check-citations in your AI editor for Steps 3-5."
