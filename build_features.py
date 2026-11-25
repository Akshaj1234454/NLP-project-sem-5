"""Data build features module wrapper."""
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from scripts.build_features import build_all_features

if __name__ == "__main__":
    build_all_features()
