import React, { useEffect } from "react";


//import crypto from "crypto";

export default function Logout (props) {

  useEffect(() => {
    onLoad();
  }, );

  async function onLoad() {
      checkLogin();
  }

  function checkLogin() {
    // document.cookie = "Sign In";
    console.log("You can now sign in another account!");
  }


  return (
    <div className="text-center">
      <h3>You've been logged out!</h3>
    </div>
  );
}