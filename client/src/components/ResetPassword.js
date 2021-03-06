import React, {Fragment, useState, useEffect} from "react";
import {Form, Button, Container, Card} from "react-bootstrap";
import axios from "axios";
// import Login from "./login";
const ResetPassword = props => {
  const [error, RaiseError] = useState(null);
  const [requestChange, setRequestChange] = useState(true);
  const [email, setEmail] = useState("");
  const [oldPassword, setOldPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmNewPassword, setConfirmNewPassword] = useState("");
  const [confirmChanged, setConfirmChanged] = useState(false);
  const [loading, setLoading] = useState(false);
  const [second, setSecond] = useState(0);
  const [userID, setUserID] = useState(null);

  useEffect(() => {
    second > 0 && second < 11 && setTimeout(() => setSecond(second + 1), 1000);
  }, [second]);

  const handleSubmitEmail = e => {
    e.preventDefault();
    setLoading(true);
    if (email.trim().length === 0) {
      RaiseError("Please enter your email address");
      setLoading(false);
    } else {
      axios
        .get(props.RESET_PASSWORD_URL, {params: {email: email}})
        .then(res => {
          if (res.data.result !== undefined) {
            setUserID(res.data.result.user_uid);
          }
          setLoading(false);
          setRequestChange(false);
          setConfirmChanged(true);
        })
        .catch(err => {
          setLoading(false);
          if (err.response !== undefined) {
            err.response.data.message === undefined
              ? RaiseError(err.response.data)
              : RaiseError(err.response.data.message);
          } else if (typeof err === "string") {
            RaiseError(err);
          }
        });
    }
  };

  const handleSubmitNewPassword = e => {
    e.preventDefault();
    if (oldPassword.trim().length === 0 || newPassword.trim().length === 0) {
      RaiseError("Please enter password");
    } else if (newPassword !== confirmNewPassword) {
      RaiseError("Confirm password mismatch");
    } else {
      let change_password_url = `${props.DEV_URL}v2/changepassword`;
      axios
        .post(change_password_url, {
          ID: userID,
          old: oldPassword,
          new: newPassword
        })
        .then(res => {
          setLoading(false);
          RaiseError(null);
          setSecond(1);
          setConfirmChanged(false);
          setTimeout(() => {
            props.history.push("/login");
            window.location.reload(false);
          }, 10000);
        })
        .catch(err => {
          setLoading(false);
          if (err.response !== undefined) {
            err.response.data.message === undefined
              ? RaiseError(err.response.data)
              : RaiseError(err.response.data.message);
          } else if (typeof err === "string") {
            RaiseError(err);
          }
        });
    }
  };
  return (
    <Fragment>
      {loading && (
        <div className='d-flex justify-content-center'>
          <div className='loading'>
            <div className='spinner-border' role='status'>
              <span className='sr-only'>Loading...</span>
            </div>
          </div>
        </div>
      )}
      {second > 0 && second < 10 && (
        <Container>
          <div class='tile is-ancestor'>
            <div class='tile is-parent'>
              <article class='tile is-child notification is-primary'>
                <p class='title is-5'>Your password has been reset.</p>
                <p class='subtitle'>
                  This page will redirect to Login page after{" "}
                  <span className='has-text-danger'>{10 - second} </span>
                  second.{" "}
                </p>
              </article>
            </div>
          </div>
        </Container>
      )}
      <Container Style={loading && "opacity : 0.5"}>
        {error !== null && error !== undefined && (
          <Fragment>
            <h6>
              <span className='icon has-text-danger'>
                <i className='fa fa-info-circle'></i>
              </span>
              <span className='has-text-danger'>{error}</span>
            </h6>
          </Fragment>
        )}
        {requestChange && (
          <Card>
            <Card.Body>
              <h5>
                To reset your password. Please enter your email address which
                you used to register your account.
              </h5>
              <Form>
                <Form.Group controlId='formBasicEmail'>
                  <Form.Control
                    type='email'
                    placeholder='Enter email'
                    onChange={e => {
                      setEmail(e.target.value);
                      RaiseError(null);
                    }}
                  />
                </Form.Group>
                <div className='text-center'>
                  <Button variant='primary' onClick={handleSubmitEmail}>
                    Submit
                  </Button>
                </div>
              </Form>
            </Card.Body>
          </Card>
        )}
        {confirmChanged && (
          <Card>
            <Card.Body>
              <h5>
                A temporary password has been sent to your email. Please using
                it to complete this process.
              </h5>
              <Form>
                <Form.Group>
                  <Form.Control
                    className='mb-3'
                    type='password'
                    placeholder='Enter the temporary password'
                    onChange={e => {
                      setOldPassword(e.target.value);
                      RaiseError(null);
                    }}
                  />
                  <Form.Control
                    className='mb-3'
                    type='password'
                    placeholder='Enter new password'
                    onChange={e => {
                      setNewPassword(e.target.value);
                      RaiseError(null);
                    }}
                  />
                  <Form.Control
                    className='mb-3'
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
        )}
      </Container>
    </Fragment>
  );
};

export default ResetPassword;
