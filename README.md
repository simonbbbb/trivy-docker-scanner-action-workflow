## Explanation

- **Trigger**: The workflow runs on any pull request targeting the `main` branch.
- **Jobs**:
  - **build-and-scan**:
    - **Checkout repository**: Checks out the repository so the workflow can access the code.
    - **Set up Docker Buildx**: Sets up Docker Buildx for building multi-platform Docker images.
    - **Cache Docker layers**: Caches Docker layers to speed up subsequent builds.
    - **Build Docker image**: Builds the Docker image using the code from the pull request.
    - **Install Trivy**: Installs the Trivy security scanner.
    - **Scan Docker image with Trivy**: Scans the built Docker image for vulnerabilities and saves the results in JSON format.
    - **Extract high and critical vulnerabilities**: Extracts high and critical vulnerabilities from the scan results and formats them into a markdown report.
    - **Capture scan results**: Captures the formatted markdown report as a multi-line environment variable.
    - **Upload scan results**: Uploads the markdown report as an artifact.
    - **Comment scan results on PR**: Posts the formatted scan report as a comment on the pull request using the `marocchino/sticky-pull-request-comment` action.
