import { ApolloClient, InMemoryCache } from '@apollo/client';

const cache = new InMemoryCache();
const uri = 'http://localhost:3000/graphql';
const name = 'satellite-finder';

export const client = new ApolloClient({
  cache,
  uri,
  name,
});
