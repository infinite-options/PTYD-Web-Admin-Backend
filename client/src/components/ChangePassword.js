import React, {Fragment, useState} from "react";
import {Modal, Form, Button} from "react-bootstrap";
import axios from "axios";

const ChangePassword = props => {
  const [oldPassword, setOldPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmNewPassword, setConfirmNewPassword] = useState("");
  const [confirm, setConfirm] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, RaiseError] = useState(null);
  const [showModal, setShowModal] = useState(true);
  const user_uid = props.user_uid;
  const CHANGEPASSWORD_URL = `${props.DEV_URL}v2/changepassword`;

  const handleSubmitNewPassword = e => {
    e.preventDefault();
    setLoading(true);
    if (oldPassword.trim().length === 0 || newPassword.trim().length === 0) {
      RaiseError("Please enter password");
    } else if (newPassword !== confirmNewPassword) {
      RaiseError("Confirm password mismatch");
    } else {
      console.log("userID in ChangePassword:", user_uid);
      axios
        .post(CHANGEPASSWORD_URL, {
          ID: user_uid,
          old: oldPassword,
          new: newPassword
        })
        .then(res => {
          setLoading(false);
          setShowModal(false);
          setConfirm(true);
          RaiseError(null);
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

  const closeConfirmModal = () => {
    setConfirm(false);
    props.ShowHideChangePasswordModal();
  };
  return (
    <Fragment>
      {confirm && (
        <Modal
          show={confirm}
          aria-labelledby='contained-modal-title-vcenter'
          centered
        >
          <Modal.Body>
            <p>Your password has been changed successfully.</p>
          </Modal.Body>

          <Modal.Footer>
            <Button variant='secondary' onClick={closeConfirmModal}>
              OK
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      <Modal
        show={showModal}
        aria-labelledby='contained-modal-title-vcenter'
        centered
        size='lg'
      >
        <Modal.Header>
          <Modal.Title>Change password</Modal.Title>
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
        </Modal.Header>
        {loading && (
          <div className='d-flex justify-content-center text_center'>
            <div className='loading'>
              <div className='spinner-border' role='status'>
                <span className='sr-only'>Loading...</span>
              </div>
            </div>
          </div>
        )}
        <Modal.Body>
          <Form>
            <Form.Group>
              <Form.Control
                className='mb-3'
                type='password'
                placeholder='Enter old password'
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
          </Form>
        </Modal.Body>

        <Modal.Footer>
          <Button
            variant='secondary'
            onClick={props.ShowHideChangePasswordModal}
          >
            Close
          </Button>
          <Button variant='primary' onClick={handleSubmitNewPassword}>
            Save changes
          </Button>
        </Modal.Footer>
      </Modal>
    </Fragment>
  );
};
export default ChangePassword;
