# GoodForm

A collection of Git hooks to be used as example and reference for other projects.

## Introduction

Hooks are a built-in feature of Git that allow developers to automate tasks and enforce policies throughout the Git workflow.

By writing custom scripts that Git can execute at key points in the development process, Git Hooks enable developers to streamline their workflow, ensure code quality, and enforce project-specific policies. In this guide, we will explore Git Hooks and show you how to use them effectively.

There are several types of Git Hooks, each with a specific purpose. Some examples cases include:

* **pre-commit:** This may check the commit to ensure it meets certain requirements, such as including a valid issue number in the commit message, or ensuring that the commit does not contain any whitespace errors.
* **pre-receive:** This may verify that all coding standards have been met.
* **prepare-commit-msg:** This may automatically add additional information to the commit message, such as the issue number or the branch name.
* **post-commit:** This may send an email notification to the team that a new commit has been made.
* **pre-push:** This may check the pushed commits to ensure they meet certain requirements, such as passing all tests.

### How to use git hooks

Git Hooks are stored in the `.git/hooks` directory of every Git repository.

The scripts should be named after the Git Hook event they correspond to (e.g., pre-commit, pre-push, post-merge) and have the appropriate permissions (chmod +x). Once the scripts are in place, Git will automatically execute them at the corresponding events.

### Tips for writing effective git hooks

1. Git Hooks should be fast and reliable. Slow or unreliable scripts can slow down the workflow and cause errors.
1. Git Hooks should be well-documented. Make sure to include comments in your scripts so that other developers can understand what they do.
1. Git Hooks should be non-intrusive. Avoid scripts that modify code or files without the user's consent.

## Getting Started

Download links:

* SSH clone URL: <ssh://git@git.jetbrains.space/risadams/main/GoodForm.git>
* HTTPS clone URL: <https://git.jetbrains.space/risadams/main/GoodForm.git>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites

What things you need to install the software and how to install them.

```shell
Examples
```

## Deployment

Add additional notes about how to deploy this on a production system.

## Resources

Notes about git hooks in general:

* <https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks>
* <https://www.atlassian.com/git/tutorials/git-hooks>

Notes about changelog format:

* <https://common-changelog.org/>
