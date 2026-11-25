"""Data normalize arguments module wrapper."""
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from scripts.normalize_arguments import normalize_post_arguments

if __name__ == "__main__":
    normalize_post_arguments()
