#!/bin/bash
# ALWISI Photo Optimization Script
# Optimizes images for web gallery

SOURCE_DIR="pictures"
OUTPUT_DIR="pictures/optimized"
THUMB_DIR="pictures/thumbs"

mkdir -p "$OUTPUT_DIR" "$THUMB_DIR"

# Function to optimize a single image
optimize_image() {
    local input="$1"
    local output="$2"
    local thumb="$3"
    
    # Full-size optimized (max 1920px wide, 85% quality)
    convert "$input" \
        -resize '1920x1920>' \
        -quality 85 \
        -strip \
        -sampling-factor 4:2:0 \
        "$output"
    
    # Thumbnail (600px wide for gallery grid)
    convert "$input" \
        -resize '600x600^' \
        -gravity center \
        -extent 600x600 \
        -quality 80 \
        -strip \
        "$thumb"
    
    echo "✓ Optimized: $(basename "$input")"
}

# Export function for parallel processing
export -f optimize_image

# Find all images and process
find "$SOURCE_DIR" -type f \( -iname "*.jpeg" -o -iname "*.jpg" \) \
    -not -path "*/optimized/*" \
    -not -path "*/thumbs/*" | \
while read -r img; do
    relative_path="${img#$SOURCE_DIR/}"
    output="$OUTPUT_DIR/${relative_path%.jpeg}.jpg"
    thumb="$THUMB_DIR/${relative_path%.jpeg}-thumb.jpg"
    
    mkdir -p "$(dirname "$output")" "$(dirname "$thumb")"
    optimize_image "$img" "$output" "$thumb"
done

echo ""
echo "✅ Optimization complete!"
echo "📊 Full-size: $OUTPUT_DIR"
echo "📊 Thumbnails: $THUMB_DIR"
