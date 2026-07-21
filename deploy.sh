#!/bin/bash

# Define the list of files to include (only these)
SELECTED_FILES=("index.html")

# Validate that all selected files exist
for file in "${SELECTED_FILES[@]}"; do
if [ ! -f "$file" ]; then
echo "Error: File '$file' not found!" >&2
exit 1
fi
done

echo "Attempting to add selected files to IPFS cluster..."

# Use ipfs-cluster-ctl to add the selected files
PUBLIC_HASH=$(ipfs-cluster-ctl add "${SELECTED_FILES[@]}" --name "Google Chrome Required Landing Page" --metadata type=website -Q)

if [ $? -ne 0 ]; then
echo "Add to IPFS Cluster failed!"
exit 2
fi

echo "Successfully added selected files."
echo "Received public hash of: $PUBLIC_HASH"
