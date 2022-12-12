import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { MuiTelInput, matchIsValidTel } from "mui-tel-input";
import { useDispatch } from "react-redux";
import { signup } from "../../app/store/authSlice";
import { toast } from "react-toastify";

function SignUp() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [phoneNumber, setPhoneNumber] = useState("+84");
  const [countryCode, setCountryCode] = useState("84");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handlePhoneChange = (phone, info) => {
    setPhoneNumber(phone);
    setCountryCode(info.countryCallingCode);
  };

  useEffect(() => {
    document.title = "Sign up";
  }, []);

  const handle_submit = async (e) => {
    e.preventDefault();
    if (password !== confirmPassword) {
      toast.error("Confirm password not match!");
    } else {
      if (matchIsValidTel(phoneNumber)) {
        const resultAction = await dispatch(
          signup({
            firstName,
            lastName,
            phoneNumber,
            countryCode,
            email,
            password,
          })
        );
        if (signup.fulfilled.match(resultAction)) {
          navigate("/verify");
        } else {
          toast.error(resultAction.payload);
        }
      } else {
        toast.error("Invalid phone number");
      }
    }
  };
  return (
    <div className="login-page">
      <div className="login-container">
        <div className="panel">
          <div className="title-container">
            <h1>
              Đăng ký thành viên Ready Booking - Tích điểm thưởng và nhận ưu đãi
            </h1>
            <p>
              Nhanh chóng, tiện lợi và an toàn. Đăng ký liền tay, rinh ngay
              quyền lợi.
            </p>
          </div>
        </div>

        <div className="form">
          <form onSubmit={handle_submit}>
            <h1>Đăng ký</h1>

            <label>Tên</label>
            <input
              className="form-input"
              type="text"
              onChange={(e) => setFirstName(e.target.value)}
              name="first_name"
              placeholder="Nhập tên..."
              value={firstName}
              required
            />
            <br />

            <label>Họ</label>
            <input
              className="form-input"
              type="text"
              onChange={(e) => setLastName(e.target.value)}
              name="last_name"
              placeholder="Nhập họ..."
              value={lastName}
              required
            />
            <br />

            <label>Email</label>
            <input
              className="form-input"
              type="email"
              onChange={(e) => setEmail(e.target.value)}
              name="email"
              placeholder="Nhập địa chỉ email..."
              value={email}
              required
            />
            <br />
            <label>Số điện thoại</label>
            <br />
            <MuiTelInput
              style={{ border: " 0px" }}
              value={phoneNumber}
              onChange={handlePhoneChange}
            />
            <br />

            <label>Mật khẩu</label>
            <input
              className="form-input"
              type="password"
              onChange={(e) => setPassword(e.target.value)}
              name="password"
              placeholder="Nhập mật khẩu..."
              value={password}
              minLength={4}
              required
            />
            <br />

            <label>Xác nhận mật khẩu</label>
            <input
              className="form-input"
              type="password"
              minLength={4}
              onChange={(e) => setConfirmPassword(e.target.value)}
              name="confirm_password"
              placeholder="Xác nhận mật khẩu..."
              value={confirmPassword}
              required
            />
            <br />

            <input type="submit" value="Đăng ký" />

            <div className="bottom-text">
              <p>Bạn đã có tài khỏan?</p>
              <Link className="link" to="/login">
                Đăng nhập
              </Link>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

export default SignUp;
