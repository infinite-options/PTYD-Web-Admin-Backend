import React, {Fragment, useEffect} from "react";
import Layout from "./layout";

const SignupWaiting = () => {
  // const [second, setSecond] = useState(60);
  useEffect(() => {
    // second > 0 && setTimeout(() => setSecond(second - 1), 1000);
    // }, [second]);
  }, []);
  return (
    <Fragment>
      <Layout />

      <div className='container box level '>
        <div class='tile is-ancestor'>
          <div class='tile is-parent'>
            <article className='tile box is-child notification is-info'>
              <h6 className='has-text-white'>
                A confirmed email has been sent to your email account with
                instruction to help you complete you registration. Thank you.
              </h6>
            </article>
          </div>
        </div>
      </div>
    </Fragment>
  );
};

export default SignupWaiting;
