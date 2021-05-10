# Blue Onion Labs technical assessment

See the assigment details [here](https://github.com/BlueOnionLabs/api-interview-question-spacex/blob/master/README.md).

I deviated a bit from the requirements and ended up building an application that allows the user to input the latitude, longitude and number of satellites dynamically. This means that the API accepts three arguments rather than just the one.

If I were building a "real world" application with these requirements I would have just gone with a lightweight node/express app (or even a lambda). However, I wanted to showcase something that more closely aligned with Blue Onion's tech stack so I went with a rails/graphql implementation. Although I do have experience with graphql, the ruby graphql package is new to me so I apologize if my code does not follow common conventions.

Given this is not a production app I avoided .env files. If we were deploying to multiple environments I would have introduced environment variables in both apps (using dot env flow)

## System requirements
- Ruby v 3.0.1 (installed via [rbenv](https://github.com/rbenv/rbenv#installation))
- Node v 14.16.0 (installed via [nvm](https://github.com/nvm-sh/nvm#installing-and-updating))

## Setup

1. Clone the repo
```
git clone git@github.com:sdpeyton/globe-onion.git
```

2. Follow the instructions in the [`/server` readme](./server/README.md) to get the server up and running

3. Follow the instructions in the [`/client` readme](./client/README.md) to get the client up and running
