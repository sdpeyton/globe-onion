import React, { createContext, useState } from 'react';
import { useForm } from 'react-hook-form';
import { useFields } from './use-fields';
import { useSatellites } from './use-satellites';

export const State = createContext();

export const StateProvider = ({ children }) => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

  const fields = useFields(register);
  const [selectedPoint, setSelectedPoint] = useState();
  const [getSatellites, { loading, satellites }] = useSatellites();

  const onSubmit = data => {
    setSelectedPoint({ lat: data.lat, lng: data.lng });
    getSatellites(data);
  };

  const value = {
    fields,
    errors,
    loading,
    satellites,
    selectedPoint,
    onSubmit: handleSubmit(onSubmit),
  };

  return <State.Provider value={value}>{children}</State.Provider>;
};
