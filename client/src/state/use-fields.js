export const useFields = register => {
  const latitude = {
    defaultValue: 40,
    ...register('lat', {
      valueAsNumber: true,
      required: 'Field is required',
      min: { value: -90, message: 'Must be greater than -90' },
      max: { value: 90, message: 'Must be less than 90' },
    }),
  };

  const longitude = {
    defaultValue: -71,
    ...register('lng', {
      valueAsNumber: true,
      required: 'Field is required',
      min: { value: -180, message: 'Must be greater than -180' },
      max: { value: 180, message: 'Must be greater than 180' },
    }),
  };

  const numberOfSatellites = {
    defaultValue: 3,
    ...register('numberOfSatellites', {
      valueAsNumber: true,
      required: 'Field is required',
    }),
  };

  return { latitude, longitude, numberOfSatellites };
};
