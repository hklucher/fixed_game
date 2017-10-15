import React from "react";
import PropTypes from "prop-types";

export const Spot = (props) => {
  return (
    <div className="col-sm-4 spot" onClick={() => {props.onClick(props.index)}}>
      {props.value} 
    </div>
  )
}

Spot.propTypes = {
  index: PropTypes.string.isRequired,
  onClick: PropTypes.func.isRequired,
  value: PropTypes.oneOf(["X", "O", ""]).isRequired
}

export default Spot
