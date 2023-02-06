import React from 'react';

const EstimateDetail = ({ detail: {
  job,
  units,
  time,
  rate,
  cost,
  margin_multiple,
  unit_of_measure,
  bid
}}) => (
  <tr>
    <td>{ job }</td>
    <td>{ `${units} ${unit_of_measure}` }</td>
    <td>{ time } hrs</td>
    <td>{ `${rate} / ${unit_of_measure}` }</td>
    <td>{ cost } $</td>
    <td>{ margin_multiple }</td>
    <td>{ bid } $</td>
  </tr>
)

export default EstimateDetail;
