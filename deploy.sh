#!/bin/bash
cd "$(dirname "$0")"
firebase use spiritual-journey-e3330
firebase deploy --only hosting,storage
