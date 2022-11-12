import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { getAddingHost, selectAddingHost } from "../../app/store/hostSlice";
import Footer from "../../components/Footer";
import NavBar from "../../components/NavBar";
import PrivateRoute from "../../utils/PrivateRoute";
import StepLeffPanel from "./StepLeffPanel";
import StepRightPanel from "./StepRightPanel";

const steps = [
  {
    label: "Thông tin cơ bản",
    description: "",
  },
  {
    label: "Vị trí",
    description: "",
  },
  {
    label: "Tiện nghi",
    description: "",
  },
  {
    label: "Ảnh",
    description: "",
  },
];

function NewAccommodation() {
  const dispatch = useDispatch();
  let { id } = useParams();
  const addingHost = useSelector(selectAddingHost);

  useEffect(() => {
    document.title = "Tạo chỗ ở";
  }, []);

  useEffect(() => {
    dispatch(getAddingHost(id));
  }, []);
  return addingHost ? (
    <PrivateRoute>
      <NavBar showLinks={false} />
      <div className="full-height-container">
        <div className="full-width">
          <div className="add-new-container">
            <div className="stepper-left">
              <StepLeffPanel steps={steps} />
            </div>
            <div className="step-right">
              <StepRightPanel />
            </div>
          </div>
        </div>
        <Footer />
      </div>
    </PrivateRoute>
  ) : (
    <div></div>
  );
}

export default NewAccommodation;
