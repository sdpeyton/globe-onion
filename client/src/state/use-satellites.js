import gql from 'graphql-tag';
import { useLazyQuery } from '@apollo/client';

const GET_SATELLITES = gql`
  query GetSatellites($lat: Float!, $lng: Float!, $numberOfSatellites: Int!) {
    closestSatellites(
      lat: $lat
      lng: $lng
      numberOfSatellites: $numberOfSatellites
    ) {
      id
      name
      lat
      lng
    }
  }
`;

export const useSatellites = () => {
  // TODO - add error handling
  const [query, { loading, data }] = useLazyQuery(GET_SATELLITES);

  const getSatellites = variables => query({ variables });

  const satellites = data?.closestSatellites;

  return [getSatellites, { loading, satellites }];
};
