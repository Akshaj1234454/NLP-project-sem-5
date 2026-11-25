"""Data label ACLED windows module wrapper."""
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from scripts.label_acled_windows import run_acled_labeling

if __name__ == "__main__":
    run_acled_labeling()
