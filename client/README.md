# Client

This is a static front-end SPA built using react to display the closest satellites to a given latitude/longitude.

## Setup

0. Make sure the server is running. Check out the [server readme](../server/README.md) for how to do that.

1. Naviagate to this directory (assuming you started at the repo root)

```
cd client
```

2. Install dependencies

```
npm i
```

3. Run the app

```
npm start
```

## Tooling

The client app was generated using [create-react-app](https://github.com/facebook/create-react-app) and retains the basic build tools that comes with this package (webpack, babel, eslint). I added prettier for autoformatting as a time saver.

Here are some tools used on top of react for app development:

- [react globe](https://github.com/chrisrzhou/react-globe): globe and satellite visualization
- [react form hook](https://github.com/react-hook-form/react-hook-form): encapsulation of form logic and validation
- [styled components](https://github.com/styled-components/styled-components): componentized css
- [material ui](https://github.com/mui-org/material-ui): google's component library based on their "material design" concept
- [apollo client](https://github.com/apollographql/apollo-client): apollo's graphql client

## Testing

I ran out of time for testing but if I were to introduce tests I would leverage react testing library's tools (they are included by default with create react app and are what I'm most comfortable writing tests in).

I would extend the render function to introduce the providers and likely mock the state provider to simplify component testing. If the app remains small I would introduce a top-level `/tests` directory that mirrors the `/src` directory. If the app was expected to grow considerably I would break out each component into a separate sub-directory in `/src` and include tests directly alongside them.
