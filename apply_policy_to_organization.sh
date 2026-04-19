#!/bin/bash

if [[ ! $AWS_REGION || ! $AWS_PROFILE ]]
then
  printf "CRIT: AWS_REGION and/pr AWS_PROFILE ENV VAR not set. Exiting with error"
  exit 1
fi

declare ROOT_ID

ROOT_ID=$(aws organizations list-roots \
  --profile "${AWS_PROFILE}" \
  --region "${AWS_REGION}" \
  | jq -r ".Roots[].Id")

{
  # apply the policy to the root account
  aws organizations enable-policy-type \
    --policy-type AISERVICES_OPT_OUT_POLICY \
    --profile "${AWS_PROFILE}" \
    --region "${AWS_REGION}" \
    --root-id "${ROOT_ID}"
} || {
  # or other responses
  # shellcheck disable=SC2203
  if [[ $(echo ?$) == 254 ]]
  then
    # policy already exists
    echo "WARN: From AWS: The specified policy type is already enabled."
    exit 0
  fi
}
