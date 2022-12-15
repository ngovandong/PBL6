import { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { login, selectAccount } from "../../app/store/authSlice";
import { toast } from "react-toastify";
function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const handle_submit = async (e) => {
    e.preventDefault();
    const actionResult = await dispatch(login({ email, password }));
    if (login.fulfilled.match(actionResult)) {
      navigate("/");
    } else {
      console.log(actionResult);
      if (actionResult.payload === "Invalid") {
        navigate("/verify");
      } else {
        toast.error(actionResult.payload);
      }
    }
  };

  const account = useSelector(selectAccount);

  useEffect(() => {
    if (account) navigate("/");
  }, []);

  useEffect(() => {
    document.title = "Login";
  }, []);

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
            <h1>Đăng nhập</h1>

            <label>Email</label>
            <input
              className="form-input"
              onChange={(e) => setEmail(e.target.value)}
              name="email"
              type="email"
              placeholder="Nhập địa chỉ email của bạn..."
              value={email}
              required
            />
            <br />

            <label>Mật khẩu</label>
            <input
              className="form-input"
              type="password"
              onChange={(e) => setPassword(e.target.value)}
              name="password"
              placeholder="Nhập mật khẩu của bạn..."
              value={password}
              required
            />
            <br />

            <input type="submit" value="Đăng nhập" />
            <div className="bottom-text">
              <p>Bạn chưa có tài khoản?</p>
              <Link className="link" to="/signup">
                Đăng ký
              </Link>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

export default Login;
