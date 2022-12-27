import { Backdrop, Button, CircularProgress } from "@mui/material";
import { matchIsValidTel, MuiTelInput } from "mui-tel-input";
import { useEffect, useState } from "react";
import profileService from "../../api-service/profileService";
import { toast } from "react-toastify";
import LoadingIcon from "../../components/LoadingWrapper";
import LoadingWrapper from "../../components/LoadingWrapper";

function Profile() {
  const [vender, setVender] = useState();

  const handleUpdate = async () => {
    if (vender.email && vender.firstName && vender.lastName) {
      if (matchIsValidTel(vender.phoneNumber)) {
        await profileService.updateVenderInfo(vender);
        toast.success("Update success!");
      } else {
        toast.error("Wrong phonenumber format");
      }
    } else {
      toast.error("Can't update because has empty field!");
    }
  };
  useEffect(() => {
    document.title = "Hồ sơ";
    profileService
      .getVenderInfo()
      .then((res) => res.data)
      .then((vender) => setVender(vender));
  }, []);
  return vender ? (
    <div>
      <h2>Thông tin liên lạc</h2>
      <div className="profile-card">
        <div className="profile-infor">
          <div className="form-group">
            <label>Tên</label>
            <input
              value={vender.firstName}
              onChange={(e) => {
                setVender((pre) => ({ ...pre, firstName: e.target.value }));
              }}
            />
          </div>
          <div className="form-group">
            <label>Họ</label>
            <input
              value={vender.lastName}
              onChange={(e) => {
                setVender((pre) => ({ ...pre, lastName: e.target.value }));
              }}
            />
          </div>
          <div className="form-group">
            <label>Email</label>
            <input
              type="email"
              value={vender.email}
              onChange={(e) => {
                setVender((pre) => ({ ...pre, email: e.target.value }));
              }}
            />
          </div>
          <div className="form-group">
            <label>Số điện thoại</label>
            <MuiTelInput
              style={{ border: " 0px" }}
              value={vender.phoneNumber}
              onChange={(phone) => {
                setVender((pre) => ({ ...pre, phoneNumber: phone }));
              }}
            />
          </div>
          <div className="form-group">
            <label>Địa chỉ</label>
            <input type="text" />
          </div>
        </div>
        <div className="profile-footer">
          <Button variant="contained" onClick={handleUpdate}>
            Update
          </Button>
        </div>
      </div>
    </div>
  ) : (
    <LoadingWrapper />
  );
}

export default Profile;
