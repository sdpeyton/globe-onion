import React from 'react';
import { StylesProvider } from '@material-ui/core/styles';
import { ApolloProvider } from '@apollo/client';
import { StateProvider } from './state';
import { client } from './apollo';
import { Globe } from './components/globe';
import { Controls } from './components/controls';
import { GlobalStyle } from './global-style';

export const App = () => {
  return (
    <ApolloProvider client={client}>
      <StylesProvider injectFirst>
        <GlobalStyle />
        <StateProvider>
          <Globe />
          <Controls />
        </StateProvider>
      </StylesProvider>
    </ApolloProvider>
  );
};
