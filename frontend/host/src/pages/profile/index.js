import { MuiTelInput } from "mui-tel-input";
import { useEffect } from "react";

function Profile() {
  useEffect(() => {
    document.title = "Hồ sơ";
  }, []);
  return (
    <div>
      <h2>Thông tin liên lạc</h2>
      <div className="profile-infor">
        <div className="form-group">
          <label>Tên</label>
          <input />
        </div>
        <div className="form-group">
          <label>Họ</label>
          <input />
        </div>
        <div className="form-group">
          <label>Email</label>
          <input type="email" />
        </div>
        <div className="form-group">
          <label>Số điện thoại</label>
          <MuiTelInput
            style={{ border: " 0px" }}
            value="+84"
            onChange={() => {}}
          />
        </div>
      </div>
    </div>
  );
}

export default Profile;
