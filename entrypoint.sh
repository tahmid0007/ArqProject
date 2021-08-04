#!/bin/bash --login
source ~/.bashrc
set -e conda activate $PROJECT_DIR/env/ds-nlp-demo-sentiment-analysis
exec "$@"