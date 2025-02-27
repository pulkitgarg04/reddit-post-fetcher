#!/bin/bash

fetch_reddit_posts() {
    local subreddit="$1"
	# Set the post limit to 5 (if not provided)
    local limit="${2:-5}"

    echo "Welcome to Reddit Post Fetcher! Made with {love} by Pulkit Garg."

    echo "Fetching top $limit posts from /r/$subreddit..."

    response=$(curl -s "https://www.reddit.com/r/$subreddit/top.json?limit=$limit")

    # Check if response is empty
    if [[ -z "$response" ]]; then
        echo "Failed to fetch the data from /r/$subreddit. Please check your internet connection or subreddit name."
        exit 1
    fi

    echo "Reddit Post Fetcher (Made by Pulkit Garg [https://www.github.com/pulkitgarg04]): " > reddit_posts.txt
    echo "--------------------------------------" >> reddit_posts.txt
    echo "Top $limit posts from /r/$subreddit: " > reddit_posts.txt
    echo "--------------------------------------" >> reddit_posts.txt

    echo "$response" | jq -r '.data.children[] | "\(.data.title)\nUpvotes: \(.data.ups)\nURL: https://reddit.com\(.data.permalink)\n---"' >> reddit_posts.txt

    echo "Posts have been saved to reddit_posts.txt"

    echo
    cat reddit_posts.txt
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