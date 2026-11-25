"""Data download and manifest module wrapper."""
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from scripts.download_and_manifest import (
    generate_curated_raw_tweet_corpus,
    generate_curated_acled_dataset,
    generate_curated_annotations_and_kappa
)

if __name__ == "__main__":
    generate_curated_raw_tweet_corpus()
    generate_curated_acled_dataset()
    generate_curated_annotations_and_kappa()
