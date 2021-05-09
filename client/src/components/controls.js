import React, { useContext } from 'react';
import styled from 'styled-components';
import {
  Card,
  CardHeader,
  CardContent,
  CardActions,
  Button,
} from '@material-ui/core';
import { LatitudeField } from './latitude-field';
import { LongitudeField } from './longitude-field';
import { NumberOfSatellitesField } from './number-of-satellites-field';
import { State } from '../state';

const StyledCard = styled(Card)`
  position: absolute;
  bottom: 16px;
  right: 16px;
  z-index: 9;
`;

const StyledCardContent = styled(CardContent)`
  display: flex;
  flex-direction: column;
`;

export const Controls = () => {
  const { onSubmit } = useContext(State);

  const handleSubmit = e => {
    e.preventDefault();
    onSubmit();
  };

  return (
    <form onSubmit={handleSubmit}>
      <StyledCard>
        <CardHeader
          title="Satellite viewer"
          subheader="Find the closest satellites to a given latitude/longitude."
        />
        <StyledCardContent>
          <LatitudeField />
          <LongitudeField />
          <NumberOfSatellitesField />
        </StyledCardContent>
        <CardActions>
          <Button type="submit">Search</Button>
        </CardActions>
      </StyledCard>
    </form>
  );
};
