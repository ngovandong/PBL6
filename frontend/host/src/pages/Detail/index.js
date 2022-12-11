import { useEffect, useState } from "react";
import { Outlet, useParams } from "react-router-dom";
import { toast } from "react-toastify";
import hostService from "../../api-service/hostService";
import Footer from "../../components/Footer";
import NavBar from "../../components/NavBar";
import PrivateRoute from "../../utils/PrivateRoute";

function Detail() {
  const { id } = useParams();
  const [host, setHost] = useState();

  const fetchData = async () => {
    const res = await hostService
      .getHost(id)
      .catch(() => toast.error("Đã xảy ra lỗi"));
    setHost(res.data);
    document.title = res.data.name;
  };

  useEffect(() => {
    fetchData();
  }, []);
  return (
    <PrivateRoute>
      <NavBar showLinks={false} />
      <div className="full-height-container">
        <div className="full-width">{host ? host.name : ""}</div>
        <Footer />
      </div>
    </PrivateRoute>
  );
}

export default Detail;
