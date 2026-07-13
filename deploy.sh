#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"
firebase use spiritual-journey-e3330
firebase deploy --only hosting:heartnotes
