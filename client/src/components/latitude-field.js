import React, { useContext } from 'react';
import { TextField } from '@material-ui/core';
import { State } from '../state';

export const LatitudeField = () => {
  const { fields, errors } = useContext(State);

  const error = errors.lat?.message;

  return (
    <TextField
      label="Latitude"
      error={!!error}
      helperText={error}
      inputProps={fields.latitude}
    />
  );
};
