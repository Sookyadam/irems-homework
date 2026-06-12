#!/bin/bash

#? Docs used: 
#? - https://docs.aws.amazon.com/cli/latest/reference/s3/
#? - https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html

# S3_ACCESS_KEY="minioadmin"
# S3_SECRET_KEY="minioadmin"
# BUCKETNAME="data"
# S3_ENDPOINT="http://localhost:9000"


# S3_REGION="us-east-1"
# SYNC_SOURCE="/home/sookya/Documents/Projects/irems/test"
# SYNC_DESTINATION="/test"

if ! command -v aws >/dev/null 2>&1; then
  echo "Error: aws CLI is not installed." >&2
  exit 1
fi

if [ -z "$S3_ACCESS_KEY" ] || [ -z "$S3_SECRET_KEY" ] || [ -z "$BUCKETNAME" ] || [ -z "$S3_ENDPOINT" ] || [ -z "$S3_REGION" ]; then
  echo "Error: One or more required variables are not set." >&2
  exit 1
fi

if [ ! -d "$SYNC_SOURCE" ]; then
  echo "Error: SYNC_SOURCE is not a valid directory: $SYNC_SOURCE" >&2
  exit 1
fi

export AWS_ACCESS_KEY_ID="$S3_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="$S3_SECRET_KEY"
export AWS_DEFAULT_REGION="$S3_REGION"

SYNC_DESTINATION="s3://${BUCKETNAME}"

aws s3 sync "$SYNC_SOURCE" "$SYNC_DESTINATION" \
  --endpoint-url "$S3_ENDPOINT" \
  --region "$S3_REGION" \
  --delete
