#!/bin/bash
# Initialize the metrics.json file for tracking feature development cycles
# Usage: ./init-metrics.sh [project-root]

PROJECT_ROOT="${1:-.}"
METRICS_DIR="$PROJECT_ROOT/docs/feature_dev"
METRICS_FILE="$METRICS_DIR/metrics.json"

# Create directory if it doesn't exist
mkdir -p "$METRICS_DIR"

# Check if metrics file already exists
if [ -f "$METRICS_FILE" ]; then
    echo "Metrics file already exists at: $METRICS_FILE"
    exit 0
fi

# Create initial metrics structure
cat > "$METRICS_FILE" << 'EOF'
{
  "total_cycles": 0,
  "successful_cycles": 0,
  "partial_cycles": 0,
  "failed_cycles": 0,
  "average_stages_completed": 0,
  "common_issues": [],
  "cycles": []
}
EOF

echo "Initialized metrics file at: $METRICS_FILE"
