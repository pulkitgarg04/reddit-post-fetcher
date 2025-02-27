#!/bin/bash

fetch_reddit_posts() {
    local subreddit="$1"
    # Set the post limit to 5 (if not provided)
    local limit="${2:-5}"
    local output_file="${subreddit}_posts.txt"

    echo "Welcome to Reddit Post Fetcher! Made with {love} by Pulkit Garg."

    echo "Fetching top $limit posts from /r/$subreddit..."

    response=$(curl -s "https://www.reddit.com/r/$subreddit/top.json?limit=$limit")

    # Check if response is empty
    if [[ -z "$response" ]]; then
        echo "Failed to fetch the data from /r/$subreddit. Please check your internet connection or subreddit name."
        exit 1
    fi

    echo "Reddit Post Fetcher (Made by Pulkit Garg [https://www.github.com/pulkitgarg04]): " > "$output_file"
    echo "--------------------------------------" >> "$output_file"
    echo "Top $limit posts from /r/$subreddit: " >> "$output_file"
    echo "--------------------------------------" >> "$output_file"

    echo "$response" | jq -r '.data.children[] | "\(.data.title)\nUpvotes: \(.data.ups)\nURL: https://reddit.com\(.data.permalink)\n---"' >> "$output_file"

    echo "Posts have been saved to $output_file"

    echo
    cat "$output_file"
}

if [[ -z "$1" ]]; then
    echo "Usage: $0 <subreddit> [limit]"
    echo "Example: $0 programming 10"
    exit 1
fi

if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Please install it and try again."
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install it and try again."
    exit 1
fi

fetch_reddit_posts "$1" "$2"