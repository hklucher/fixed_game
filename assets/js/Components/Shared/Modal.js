import React from "react"
import PropTypes from "prop-types"

const Modal = (props) => {
  if (!props.hidden) {
    return (
      <div>
        {props.children}
      </div>
    )
  } else {
    return null
  }
}

Modal.propTypes = {
  hidden: PropTypes.bool
}

Modal.defaultProps = {
  hidden: false
}

export default Modal
