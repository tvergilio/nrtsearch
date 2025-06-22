#!/bin/bash
# An idempotent script to run the full nrtsearch demo workflow.
# It cleans up the old index before starting to ensure a fresh run.

# Exit immediately if a command exits with a non-zero status.
set -e

CLIENT_PATH="./build/install/nrtsearch/bin/nrtsearch_client"
EXAMPLES_PATH="examples"
INDEX_NAME="test_library"

echo "--- 0. Resetting: Deleting old index if it exists ---"
# The '|| true' ensures the script doesn't fail if the index doesn't exist on the first run.
$CLIENT_PATH deleteIndex --indexName $INDEX_NAME || true

echo "\n--- 1. Creating Index: ${INDEX_NAME} ---"
$CLIENT_PATH createIndex --indexName $INDEX_NAME

echo "\n--- 2. Registering Fields ---"
$CLIENT_PATH registerFields -f ${EXAMPLES_PATH}/fields.json

echo "\n--- 3. Starting Index ---"
$CLIENT_PATH startIndex -f ${EXAMPLES_PATH}/start.json

echo "\n--- 4. Adding Documents ---"
$CLIENT_PATH addDocuments -i $INDEX_NAME -f ${EXAMPLES_PATH}/my_docs.csv -t csv

echo "\n--- 5. Searching for 'Gatsby' ---"
$CLIENT_PATH search -f ${EXAMPLES_PATH}/search.json

echo "\n--- Demo Complete! ---"
