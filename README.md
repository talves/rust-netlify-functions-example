## Introduction

This example shows how to deploy Rust code on Netlify Functions.

Functions can be deployed using [Netlify's CLI](https://ntl.fyi/cli) as well as the Netlify Build environment.

You can copy this repository and deploy it to Netlify by clicking the button below.

<a href="https://app.netlify.com/start/deploy?repository=https://github.com/talves/rust-netlify-functions-example"><img src="https://www.netlify.com/img/deploy/button.svg" alt="Deploy to Netlify"></a>

After clicking that button, you’ll authenticate with GitHub and choose a repository name. Netlify will then automatically create a repository in your GitHub account with a copy of the files from the template. Next, it will build and deploy the new site on Netlify, bringing you to the site dashboard when the build is complete.

## Build & Deployment

Use `./build.sh` to build the release binaries. Commit the new binary and deploy to Netlify

### Deploying with CLI

You need to install Netlify's CLI first:

```
npm install -g netlify-cli
```

Then run the following command:

```
netlify deploy --build
```

### Deploying with Netlify Build

Create a new Netlify site and link it to your repository. Netlify will detect the Rust functions automatically, build and deploy them for you.
