"""Data filter march posts module wrapper."""
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from scripts.filter_march_posts import filter_march_events

if __name__ == "__main__":
    filter_march_events()
