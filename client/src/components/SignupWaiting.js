import React, {Fragment, useState, useEffect} from "react";
import Layout from "./layout";

const SignupWaiting = () => {
  const [second, setSecond] = useState(5);
  useEffect(() => {
    second > 0 && setTimeout(() => setSecond(second - 1), 1000);
  }, [second]);
  return (
    <Fragment>
      <Layout />

      <div className='container box level '>
        <div class='tile is-ancestor'>
          <div class='tile is-parent'>
            <article className='tile box is-child notification is-info'>
              <h6 className='has-text-white'>
                A confirmed email has been sent to your email account with
                instruction to help you complete you registration. That
                comfirmed email will be expired in {second} seconds. Please
                doing it ASAP.
              </h6>
            </article>
          </div>
        </div>
      </div>
    </Fragment>
  );
};

export default SignupWaiting;
