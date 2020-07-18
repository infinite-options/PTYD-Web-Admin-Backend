import React from "react";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import {Button} from "react-bootstrap";
const ErrorHandle = props => {
  const errMsg = props.errMsg;
  var open = true;
  const closeError = () => {
    open = !open;
    props.closeError();
  };
  return (
    <>
      <Dialog
        open={open}
        aria-labelledby='alert-dialog-title'
        aria-describedby='alert-dialog-description'
      >
        <DialogTitle id='alert-dialog-title'>{"Error!"}</DialogTitle>
        <DialogContent>
          <DialogContentText id='alert-dialog-description'>
            {errMsg}
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={closeError} color='danger' variant='danger'>
            Close
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
};

export default ErrorHandle;
