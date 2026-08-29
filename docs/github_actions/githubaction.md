# Github Action
## Overview
Github actions is a CI/CD automation platform built into Github. It lets you tell Github: "Whenever something happens in my repository, automatically run the commands."

## The important terminology
* Workflow
* Job
* Steps
* Actions/commands
* Runner

## Workflow
Workflow is a automated process that executes one or more jobs to build, test, deploy the code. It allows developer CI/CD inside a github.

## Jobs
A job is a defined set of steps within a workflow that executes on the same runnder instance. Multiple jobs can run in single workflow.

## Runner
A runner is the actual compute serves or virtual machine that executes the jobs defined in your automation workflow.

## Step
A step is a small executable unit of a job that performs an individual task.

## Action
An action in a reusable individiual task or extension that serves as a building block for automation workflows.

## Triggers/Events
Triggers are specific activities that automatically start a workflow run. For example we can trigger the workflow when push the commit and pull request created.