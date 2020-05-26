import React, {Fragment, useState} from "react";
import {Container} from "react-bootstrap";
import axios from "axios";
const ChangePassword = props => {
  const [oldPassword, setOldPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmNewPassword, setConfirmNewPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, RaiseError] = useState(null);

  const handleSubmitNewPassword = e => {
    e.preventDefault();
    setLoading(true);
    if (oldPassword.trim().length === 0 || newPassword.trim().length === 0) {
      RaiseError("Please enter password");
    } else if (newPassword !== confirmNewPassword) {
      RaiseError("Confirm password mismatch");
    } else {
      axios
        .post(props.CHANGE_PASSWORD_URL, {
          email: email,
          oldPassword: oldPassword,
          newPassword: newPassword
        })
        .then(res => {
          console.log("result after sending new password:", res);
          setLoading(false);
          props.history.push("/login");
          window.location.reload(false);
        })
        .catch(err => {
          setLoading(false);
          if (err.respose !== undefined) {
            RaiseError(err.response.message);
          } else if (typeof err === "string") {
            RaiseError(err);
          }
        });
    }
  };
  return (
    <Fragment>
      <Container>
        <Card>
          <Card.Body>
            <h5>
              A temporary password has been sent to your email. Please using it
              to complete this process.
            </h5>
            <Form>
              <Form.Group>
                <Form.Control
                  type='password'
                  placeholder='Enter the temporary password'
                  onChange={e => {
                    setOldPassword(e.target.value);
                    RaiseError(null);
                  }}
                />
                <Form.Control
                  type='password'
                  placeholder='Enter new password'
                  onChange={e => {
                    setNewPassword(e.target.value);
                    RaiseError(null);
                  }}
                />
                <Form.Control
                  type='password'
                  placeholder='Confirm new password'
                  onChange={e => {
                    setConfirmNewPassword(e.target.value);
                    RaiseError(null);
                  }}
                />
              </Form.Group>
              <div className='text-center'>
                <Button variant='primary' onClick={handleSubmitNewPassword}>
                  Submit
                </Button>
              </div>
            </Form>
          </Card.Body>
        </Card>
      </Container>
    </Fragment>
  );
};
export default ChangePassword;
