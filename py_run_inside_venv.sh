#!/bin/bash

python -c 'import sys; print("Inside venv" if hasattr(sys, "real_prefix") or (hasattr(sys, "base_prefix") and sys.base_prefix != sys.prefix) else "Not inside venv")'
