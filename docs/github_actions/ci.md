# CI (Continuous Integration)
## Definition
CI is the process of automatically checking your code whenever you push changes to the repository, so you can know whether the new code is working correctly before it gets merged or deployed.

## Github Actions
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

### Workflow:
A *Workflow* is a automated process that execute one or more jobs to build, test, deploy code. It allows developer CI/CD inside a github. For our project *Maintix CI* is a workflow

### Job:
A *Job* is a defined set of steps within a workflow that execute on the same runner instance. Multiple jobs can run in single workflow. Ex: client, server, e2e.

### Runner:
A *Runner* is the actual compute server or virtual machine that execute the jobs defined in your automation workflow. Ex: `runs-on: ubuntu-latest`.

### Step:


