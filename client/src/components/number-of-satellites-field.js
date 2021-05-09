import React, { useContext } from 'react';
import {
  Select,
  InputLabel,
  FormControl,
  FormHelperText,
} from '@material-ui/core';
import { range } from 'lodash';
import { State } from '../state';

export const NumberOfSatellitesField = () => {
  const { fields, errors } = useContext(State);

  const initialOption = <option key={-99} value="" />;
  const options = range(10).map(num => (
    <option key={num} value={num + 1}>
      {num + 1}
    </option>
  ));

  const error = errors.numberOfSatellites?.message;

  return (
    <FormControl error={!!error}>
      <InputLabel htmlFor="number-of-satellites">
        Number of satellites
      </InputLabel>
      <Select
        native
        label="longitude"
        inputProps={{
          id: 'number-of-satellites',
          ...fields.numberOfSatellites,
        }}
      >
        {[initialOption, ...options]}
      </Select>
      {error && <FormHelperText>{error}</FormHelperText>}
    </FormControl>
  );
};
