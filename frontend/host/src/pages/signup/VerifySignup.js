import { useEffect } from "react";
import { useSelector } from "react-redux";
import { selectVerifyEmail } from "../../app/store/authSlice";
import Footer from "../../components/Footer";
import VerifyNavBar from "../../components/VerifyNavbar";

function VerifySignup() {
  useEffect(() => {
    document.title = "Xác minh tài khoản";
  }, []);

  const email = useSelector(selectVerifyEmail);
  return (
    <div>
      <VerifyNavBar />
      <div className="full-height-container">
        <div className="full-width">
          <div className="main-container">
            <h2>Xác minh tài khoản</h2>
            <div className="verify-container">
              <p>
                Chúng tôi đã gửi email có đường dẫn xác minh đến <b>{email}</b>.
              </p>
              <br />
              <p>
                Để xác minh tài khoản vui lòng nhấn đường dẫn trong email chúng
                tôi vừa gửi.
              </p>
            </div>
          </div>
        </div>
        <Footer />
      </div>
    </div>
  );
}

export default VerifySignup;
