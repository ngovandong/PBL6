import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { getAddingHost, selectAddingHost } from "../../app/store/hostSlice";
import LoadingWrapper from "../../components/LoadingWrapper";
import StepLeftPanel from "../newAccommodation/StepLeffPanel";
import StepRightPanel from "../newAccommodation/StepRightPanel";

function InfoTab() {
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
    <div className="add-new-container">
      <div className="stepper-left">
        <StepLeftPanel isInfoTab />
      </div>
      <div className="step-right">
        <StepRightPanel />
      </div>
    </div>
  ) : (
    <LoadingWrapper />
  );
}

export default InfoTab;
