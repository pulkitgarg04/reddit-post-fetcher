# Reddit Post Fetcher

A simple Bash script to fetch the top posts from any subreddit using the Reddit API. The fetched posts are saved to the file `[subreddit]_posts.txt`. 

---

## Features
- Fetches top posts from any subreddit.
- Allows specifying the number of posts to fetch (default: 5).
- Outputs the post title, upvotes, and a direct URL to the post.
- Saves the results to a `[subreddit]_posts.txt` file.
- Error handling for invalid subreddit names or missing dependencies (`curl` and `jq`).

---

## Prerequisites
### Dependencies
Make sure the following tools are installed:
1. [curl](https://curl.se/) - For sending HTTP requests.
2. [jq](https://stedolan.github.io/jq/) - For parsing JSON responses.

#### **Installation Instructions**
##### For Linux (Ubuntu):
- Install `curl` and `jq`:
  ```bash
  sudo apt update
  sudo apt install curl jq -y
  ```

##### For macOS:
- Use Homebrew:
    ```bash
    brew install curl jq
    ```
##### For Windows:
- Install curl:
    1. Download from [curl](https://curl.se/windows/) for Windows.
    2. Add curl to your system PATH.

- Install jq:
    1. Download the .exe file from [jq](https://jqlang.org/download/) releases.
    2. Rename it to jq.exe and add it to your system PATH.

## Usage
#### Running the Script
1. Save the script as `post_fetcher.sh`.
2. Make it executable:
    ```bash
    chmod +x post_fetcher.sh
    ```
3. Run the script with the following syntax:
    ```bash
    ./post_fetcher.sh [subreddit] [limit]
    ```
- [subreddit]: The name of the subreddit (e.g., programming).
- [limit]: (Optional) The number of posts to fetch (default is 5).

#### Examples
1. Fetch the top 5 posts from the programming subreddit:
    ```bash
    ./post_fetcher.sh programming
    ```

2. Fetch the top 10 posts from the gaming subreddit:
    ```bash
    ./post_fetcher.sh gaming 10
    ```

## Output
The script generates a file `[subreddit]_posts.txt` containing the fetched posts in the following format:

```yaml
Top <limit> posts from /r/<subreddit>:
--------------------------------------
Post Title
Upvotes: <number>
URL: https://reddit.com/<post_permalink>
---
```

### Error Handling
1. Invalid Subreddit or No Internet:
- The script will display:
    ```pgsql
    Failed to fetch the data from /r/<subreddit>. Please check your internet connection or subreddit name.
    ```

2. Missing Dependencies:
- If curl or jq is not installed, the script will notify you and exit.

3. Invalid Usage:
- If the subreddit name is not provided, the script will display usage instructions:
    ```bash
    Usage: ./post_fetcher.sh [subreddit] [limit]
    Example: ./post_fetcher.sh programming 10
    ```

## Contribution
Feel free to fork the repository and submit pull requests to enhance the functionality of the script.

#### Steps to Contribute
1. Fork the Repository:
    - Click the Fork button at the top right of the repository page to create a copy of the repository in your GitHub account.

2. Clone Your Fork:
    - Clone your forked repository to your local machine:

    ```bash
    git clone https://github.com/pulkitgarg04/reddit-post-fetcher.git
    cd reddit-post-fetcher
    ```

3. Create a New Branch:
    - Create a new branch for your changes:
    ```bash
    git checkout -b feature/your-feature-name
    ```

4. Make Your Changes:
    - Edit the script or add new features. Make sure your changes are well-tested.

5. Commit Your Changes:
    - After making changes, commit them with a clear and descriptive message:
    ```bash
    git add .
    git commit -m "Add a detailed description of your changes"
    ```

6. Push Your Changes:
- Push the changes to your forked repository:
    ```bash
    git push origin feature/your-feature-name
    ```

7. Open a Pull Request (PR):
- Go to the original repository on GitHub.
- Click on the Pull Requests tab.
- Click New Pull Request and choose your branch from your fork as the source.
- Provide a descriptive title and explanation of your changes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.