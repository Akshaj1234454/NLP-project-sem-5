#!/usr/bin/env bash
# ==============================================================================
# Setup Script for Civil Unrest March Event Extraction & Prediction
# Compatible with macOS (Apple Silicon / Intel) and Linux
# ==============================================================================

set -e

echo "=== [1/4] Checking Python Environment ==="
PYTHON_BIN=$(which python3 || which python)
if [ -z "$PYTHON_BIN" ]; then
    echo "Error: Python 3.10+ is required but not found."
    exit 1
fi
echo "Using Python: $($PYTHON_BIN --version)"

echo "=== [2/4] Installing Required Dependencies ==="
$PYTHON_BIN -m pip install --upgrade pip
$PYTHON_BIN -m pip install -r requirements.txt

# On macOS, ensure libomp is linked for LightGBM if necessary
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Configuring macOS OpenMP dynamic library links..."
    TORCH_LIB=$($PYTHON_BIN -c "import torch, os; print(os.path.join(os.path.dirname(torch.__file__), 'lib'))" 2>/dev/null || echo "")
    LGBM_LIB=$($PYTHON_BIN -c "import lightgbm, os; print(os.path.join(os.path.dirname(lightgbm.__file__), 'lib'))" 2>/dev/null || echo "")
    if [ -f "$TORCH_LIB/libomp.dylib" ] && [ -d "$LGBM_LIB" ]; then
        cp -n "$TORCH_LIB/libomp.dylib" "$LGBM_LIB/" 2>/dev/null || true
    fi
fi

echo "=== [3/4] Verifying Core ML Libraries ==="
$PYTHON_BIN -c "import torch, transformers, lightgbm, sklearn, fastapi, streamlit; print('All core libraries verified!')"

echo "=== [4/4] Setup Complete ==="
echo "You can now run:"
echo "  ./scripts/smoke_test.sh     # Execute full end-to-end pipeline test"
echo "  ./scripts/run_demo.sh       # Launch API and Streamlit dashboard"
