#!/bin/bash
#set -ex

expires_file=/tmp/protocol-admin-expires
if [[ -f $expires_file ]]; then
  expires_str=$(cat "$expires_file")
  expires=$(date -d "$expires_str" +%s)
  now=$(date +%s)
  remaining=$(((expires - now) / 60 - 30))
  if ((remaining > 0)); then
    echo "$remaining mins left before re-auth" >&2
    exit 0
  fi
fi

if ! which aws &>/dev/null; then
  echo "Please install AWS CLI tools" >&2
  exit 1
fi

device=$(aws configure --profile protocol-admin get mfa_serial)
if [ -z "$device" ]; then
  echo "Please add the mfa_serial key to your AWS 'protocol' profile in ~/.aws/config. Its value should be the ARN of your MFA device for the 'protocol-labs-engineering' organization" >&2
  exit 1
fi

if [ $# -eq 1 ]; then
  token=$1
elif command -v op; then
  # Get the token from 1Password
  token=$(op item get 'AWS (protocol-labs-engineering)' --fields type=otp | grep TOTP | awk '{print $2}')
else
  echo -n "MFA token for protocol-labs-engineering: " >/dev/stderr
  read -r token
fi

json=$(aws --profile protocol-admin sts get-session-token --serial-number "$device" --token-code "$token")

# shellcheck disable=SC2181
if [ $? -ne 0 ]; then
  echo "Unable to authenticate"
  exit 1
fi

keyid=$(echo "$json" | jq -r .Credentials.AccessKeyId)
secret=$(echo "$json" | jq -r .Credentials.SecretAccessKey)
token=$(echo "$json" | jq -r .Credentials.SessionToken)
expiration=$(echo "$json" | jq -r .Credentials.Expiration)

profile_name=protocol
aws configure set profile.$profile_name.aws_access_key_id "$keyid"
aws configure set profile.$profile_name.aws_secret_access_key "$secret"
aws configure set profile.$profile_name.aws_session_token "$token"

echo "$expiration" >"$expires_file"

echo
echo "Current time is $(date)."
echo "Credentials will expire at $(date -d "$expiration")"
echo
echo "Credentials configured"
