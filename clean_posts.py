"""Data clean posts module wrapper."""
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from scripts.clean_posts import run_cleaning_pipeline

if __name__ == "__main__":
    run_cleaning_pipeline()
