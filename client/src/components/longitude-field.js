import React, { useContext } from 'react';
import { TextField } from '@material-ui/core';
import { State } from '../state';

export const LongitudeField = () => {
  const { fields, errors } = useContext(State);

  const error = errors.lng?.message;

  return (
    <TextField
      label="Longitude"
      error={!!error}
      helperText={error}
      inputProps={fields.longitude}
    />
  );
};
