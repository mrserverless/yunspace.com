# YunSpace.com

[![Build Status](https://app.snap-ci.com/yunspace/yunspace.com/branch/master/build_image)](https://app.snap-ci.com/yunspace/yunspace.com/branch/master)

My blog using Hugo static site generator and deployed to S3 + CloudFront by SnapCI.

## Usage
Run locally

    make start
    # go to localhost:1313
    make stop

Build and deploy to AWS

    make build deploy