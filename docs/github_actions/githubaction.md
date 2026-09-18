# Github Action
## Overview
GitHub Actions is an automation platform built into GitHub. It allows you to tell GitHub, when something happens in the repository, automatically perform these tasks. In this project using GitHub Actions to automate the CI process

### Where do GitHub Actions workflows live?
```text
Maintix/
│
├── client/
├── server/
│
└── .github/
    └── workflows/
        └── ci.yml
```
The YAML file is the instruction file for GitHub Actions.

## The important terminology
* Workflow
* Job
* Steps
* Actions/commands
* Runner

### Workflow
A *Workflow* is a automated process that execute one or more jobs to build, test, deploy code. It allows developer CI/CD inside a github. For our project *Maintix CI* is a workflow

### Triggers/Events
Triggers are specific activities that automatically start a workflow run. For example we can trigger the workflow when push the commit and pull request created.

### Jobs
A *Job* is a defined set of steps within a workflow that execute on the same runner instance. Multiple jobs can run in single workflow. Ex: client, server, e2e.

### Runner
A *Runner* is the actual compute server or virtual machine that execute the jobs defined in your automation workflow. Ex: `runs-on: ubuntu-latest`.

### Step
A *Step* is a small executable unit of a job that performs an individual task. For example
```yml
- name: Install dependencies
  run: npm ci
```

### Action
An *Action* is a reusable individiual task or extension that serves as a building block for automation workflows. Ex: `uses: actions/checkout@v4` and `uses: actions/setup-node@v4`.