# Check if domain parameter is provided
if [ -z "$1" ]; then
  echo "[!] Usage: $0 <target-domain>"
  exit 1
fi

TARGET="$1"
OUTPUT_DIR="wordlist_output_${TARGET//./_}"
CEWL_OUTPUT="$OUTPUT_DIR/cewl.txt"
WAYBACK_OUTPUT="$OUTPUT_DIR/wayback.txt"
FINAL_WORDLIST="$OUTPUT_DIR/final_wordlist.txt"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "[*] Generating wordlist from live site using cewl..."
# The -m parameter forces a minimum word length; adjust as needed
/usr/local/bin/cewl "$TARGET" -m 4 -w "$CEWL_OUTPUT"

echo "[*] Fetching historical URLs with waybackurls..."
# Get URLs from the Wayback Machine
echo "$TARGET" | waybackurls > "$WAYBACK_OUTPUT"

# Optionally, extract words from the URLs (remove non-alphanumeric characters, split at delimiters)
echo "[*] Extracting words from Wayback URLs..."
cat "$WAYBACK_OUTPUT" | \
  tr '[:upper:]' '[:lower:]' | \
  tr -c '[:alnum:]' '[\n*]' | \
  grep -E '.{4,}' | sort -u > "$OUTPUT_DIR/wayback_words.txt"

# Merge cewl and wayback generated words, remove duplicates and sort them.
echo "[*] Merging results into final wordlist..."
cat "$CEWL_OUTPUT" "$OUTPUT_DIR/wayback_words.txt" | sort -u > "$FINAL_WORDLIST"

echo "[*] Custom wordlist generated: $FINAL_WORDLIST"
