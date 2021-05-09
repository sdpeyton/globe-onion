import React, { useContext, useMemo } from 'react';
import ReactGlobe from 'react-globe';
import { v4 as uuid } from 'uuid';
import { State } from '../state';

import 'tippy.js/dist/tippy.css';
import 'tippy.js/animations/scale.css';

// we need some value here in order to display the markers
const MARKER_VALUE = 50;
const SELECTED_POINT_MARKER_COLOR = 'blue';
const SATELLITE_MARKER_COLOR = 'red';

const markerTooltipRenderer = marker => {
  if (marker.type === 'satellite') return `Name: ${marker.name}`;
  return 'Selected point';
};

const options = {
  enableMarkerGlow: false,
  markerType: 'dot',
  markerTooltipRenderer,
};

export const Globe = () => {
  const { satellites, selectedPoint } = useContext(State);

  const markers = satellites?.map(satellite => ({
    ...satellite,
    type: 'satellite',
    color: SATELLITE_MARKER_COLOR,
    coordinates: [satellite.lat, satellite.lng],
    value: MARKER_VALUE,
  }));

  if (selectedPoint) {
    markers?.push({
      id: uuid(),
      coordinates: [selectedPoint.lat, selectedPoint.lng],
      color: SELECTED_POINT_MARKER_COLOR,
      value: MARKER_VALUE,
    });
  }

  const focus = useMemo(() => {
    return selectedPoint && [selectedPoint.lat, selectedPoint.lng];
  }, [selectedPoint]);

  return (
    <ReactGlobe
      height="100vh"
      width="100vw"
      focus={focus}
      markers={markers}
      options={options}
    />
  );
};
